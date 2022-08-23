for file in $(git ls-files --modified --others --exclude-standard); do
    git add $file
    git commit -m "adding $file {$1} 🚀"
done
git push