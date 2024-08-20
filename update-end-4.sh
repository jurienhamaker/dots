cd end_4

git checkout main
git pull

git checkout current
#git diff $(git rev-parse HEAD)...f47500ce73377aa1728d9b176aacbf364994b20c >diff.patch
git diff $(git rev-parse HEAD)...main >diff.patch

sed "s/rename \(to\|from\) \.\(config\|local\)/rename \1 dotfiles\/\2/g" diff.patch >temp.patch
rm -rf diff.patch
sed "s/\(a\|b\)\/\.\(config\|local\)/\1\/dotfiles\/\2/g" temp.patch >diff.patch
rm -rf temp.patch

cd ../

git apply --reject --whitespace=fix end_4/diff.patch
rm -rf end_4/diff.patch
