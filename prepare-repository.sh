#!/bin/bash
gitRepoUrl="$1"
bufBuildFolder="$2"

git clone "$gitRepoUrl" "out"
cd "./out/"

# Remove all folders that do not start with a dot
for dir in $(find "." -type d ! -regex '.*\..*'); do
    rm -r "$dir"
done

cp -a "$bufBuildFolder/." "."
git config --local user.email "machine@cow.network"
git config --local user.name "github-udder-machine"
git add "."