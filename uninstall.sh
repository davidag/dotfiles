
for dir in $(find . -maxdepth 1 -type d -name '[!.]*' | xargs basename -a); do
    stow --verbose --delete "$dir"
done
