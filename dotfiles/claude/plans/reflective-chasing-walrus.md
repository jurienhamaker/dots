# Fix: sync-artist photo not updating on existing artists

## Context

`POST /api/sync-artist` updates an existing artist with `photo_url` filled, but the uploaded photo never appears on the artist document in Prismic. The create path works; only the update path (and the create→update retry fallback) is broken.

## Root cause

`src/app/api/sync-artist/route.ts` creates two separate `Migration` instances. The `photoAsset` is registered on the outer one, but the migration actually executed against Prismic is a different inner instance that has no knowledge of the asset.

Flow:
1. `route.ts:237` — outer `migration = getPrismicMigration()` (instance **A**).
2. `route.ts:239-243` — `photoAsset = A.createAsset(photoFile, …)`. Asset stored in `A._assets`.
3. `route.ts:246` — update path calls `updateArtistDocuments(client, uid, …, photoAsset)`.
4. `route.ts:72` inside `updateArtistDocuments` — `const migration = getPrismicMigration()` (instance **B**).
5. `route.ts:97` — `B.updateDocument(updatedArtist)` where `updatedArtist.data.photo === photoAsset` (a reference owned by **A**).
6. `route.ts:100` — `executeMigration(client, B)` runs `client.migrate(B)`.

Per `@prismicio/client` `WriteClient.migrate`, only `migration._assets` of the passed migration are uploaded (`WriteClient.ts:267`, `migrateCreateAssets` loops `migration._assets`). Instance **A** is never executed. Instance **B** has an empty `_assets` map, so:

- The photo file is never uploaded.
- The document `photo` field references an asset object whose backing upload never happened — write fails silently or leaves the field blank/stale.

Same defect on the create→update retry fallback (`route.ts:298-307`): after a failed create on migration **A**, it calls `updateArtistDocuments` which builds migration **C**, inheriting the same orphaned `photoAsset`.

## Fix

Register the photo asset on the **same** migration instance that will be executed. Pass the `File` (not the asset handle) into `updateArtistDocuments` and have it create the asset on its own migration.

The previous design goal ("don't re-download the photo when retrying") is preserved: `photoFile` (the `File` in memory) is still created once via `downloadPhoto`. Only the `createAsset` call — which is a cheap in-memory registration — is repeated per migration.

### Changes — `src/app/api/sync-artist/route.ts`

1. `updateArtistDocuments` signature: replace `photoAsset: PrismicMigrationAsset | undefined` param with `photoFile: File | undefined` (plus the alt-text / name already available via `name`).
2. Inside `updateArtistDocuments` after `getPrismicMigration()`, register the asset on the local migration:
   ```ts
   const photoAsset = photoFile
       ? migration.createAsset(photoFile, photoFile.name, {
               alt: `${name} - Stichting Jazz Collectief`,
           })
       : undefined;
   ```
   Use this local `photoAsset` in the document update.
3. In `POST`:
   - Remove the outer `const migration = getPrismicMigration()` and the outer `photoAsset = migration.createAsset(…)` (lines 237-243) from before the `isUpdate` branch.
   - Move migration + asset creation **into** the create branch only.
   - Pass `photoFile` (not `photoAsset`) to `updateArtistDocuments` on both the update path and the create→update retry fallback.
4. Keep `downloadPhoto` (and `await unlink(tempPath)` cleanup, if used) at the outer scope so the file is fetched once and reused across create, update, and retry paths.

### Critical file

- `src/app/api/sync-artist/route.ts` — `updateArtistDocuments` (lines 64-101), `POST` photo / migration setup (lines 221-323).

No changes needed in `src/util/prismic-write.ts`.

## Verify

End-to-end with a real Prismic write token against the `jazzcollectief` repo:

1. **Update with new photo** — artist already exists; `POST /api/sync-artist` with `photo_url` pointing at a reachable image. Expect `{ success: true, action: 'updated' }`. Open the artist in Prismic and confirm `photo` and `meta_image` reference the newly uploaded asset for both `nl-nl` and `en-gb`.
2. **Create** — unique `firstname`/`lastname`, with `photo_url`. Expect `action: 'created'` and photo present in both locales.
3. **Create→update fallback** — submit a payload whose UID exists but whose `nl-nl` document was just created so `getByUID` race might miss it (or simulate by briefly reusing a slug). Confirm retry path returns `action: 'updated'` and the photo is set.
4. **Update without photo** — omit `photo_url`. Expect existing photo preserved; no asset uploads triggered.
5. Run `pnpm tsc --noEmit` to ensure the signature change type-checks.
