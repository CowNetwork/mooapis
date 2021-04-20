#!/bin/bash
gitRepoUrl="$1"
bufBuildFolder="$2"
targetFolder="$3"

git clone "$gitRepoUrl" "$targetFolder"

# Remove all folders that do not start with a dot
for dir in $(find "$targetFolder" -maxdepth 1 -mindepth 1 -type d ! -name '.*'); do
    echo "Clear $dir .."
    rm -r "$dir"
done

cp -a "$bufBuildFolder/." "$targetFolder"
cd "$targetFolder"

git config --global user.email "machine@cow.network"
git config --global user.name "github-udder-machine"
git add "."