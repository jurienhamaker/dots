#!/bin/sh
# Sizes scroller columns by window count when the count on a visible scroller tag changes:
# 1 -> 1.0, 2 -> 0.5, 3+ -> 0.33333. Manual SUPER+r changes stick until a window opens/closes there.
# set_proportion only acts on the focused monitor, so other monitors are focused briefly, then focus is restored.
# shortcut: counts windows, not scroller stacks (IPC exposes no stack info); stacked windows get narrower columns than needed.

state=' ' # " monitor:tags=count " entries: last count applied per visible tag set

proportion() {
	case $1 in
	1) echo 1.0 ;;
	2) echo 0.5 ;;
	*) echo 0.33333 ;;
	esac
}

# Each event is only a trigger; state is re-read live so queued (stale) events can't apply old counts.
mmsg watch all-monitors | while read -r _; do
	monitors=$(mmsg get all-monitors) || continue
	clients=$(mmsg get all-clients) || continue
	active=$(printf '%s' "$monitors" | jq -r '.monitors[] | select(.active) | .name')
	targets=$(printf '%s' "$monitors" | jq -r --argjson c "$clients" '
		.monitors[]
		| select(.layout_symbol == "S" or .layout_symbol == "VS")
		| .name as $mon
		| [.tags[] | select(.is_active) | .index | tostring] as $tags
		| [$c.clients[]
			| select(.monitor == $mon and .is_visible and (.is_floating | not)
				and (.is_minimized | not) and (.is_unglobal | not))
			| .id | tostring] as $ids
		| "\($mon) \($mon):\($tags | join(",")) \($ids | length) \($ids | join(" "))"')

	while read -r mon key count ids; do
		[ -n "$key" ] || continue
		case $state in *" $key=$count "*) continue ;; esac
		state="$(printf '%s' "$state" | sed "s/ $key=[0-9]* / /")$key=$count "
		[ "$count" -gt 0 ] || continue

		p=$(proportion "$count")
		prev=$(mmsg get focusing-client | jq -r '.id // empty' 2>/dev/null)
		[ "$mon" != "$active" ] && mmsg dispatch "focusmon,name:$mon" >/dev/null
		# Resizing keeps the focused window in place and stacks the rest around it, so the column drifts
		# off the top. Focus the first window and give it full height: that can only fit at the top edge,
		# so mango snaps it there; the resize below then keeps it in place.
		first=${ids%% *}
		mmsg dispatch focusid "client,$first" >/dev/null
		[ "$count" -gt 1 ] && mmsg dispatch "set_proportion,1.0" "client,$first" >/dev/null
		for id in $ids; do
			mmsg dispatch "set_proportion,$p" "client,$id" >/dev/null
		done
		[ "$mon" != "$active" ] && mmsg dispatch "focusmon,name:$active" >/dev/null
		[ -n "$prev" ] && mmsg dispatch focusid "client,$prev" >/dev/null
	done <<EOF
$targets
EOF
done
