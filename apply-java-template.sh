#!/bin/bash
# This script takes the generated folders and files from buf.build and
# puts a pom and a src folder into it, so that we can copy the contents
# directly into the Git repository.
# 
# Example:
# - we have the folder '/cow/indigo/v1' then we take the last folder name as
# version and the second to last as name for our Maven project.
# - we use gomplate to template all files from the Java template folder and put
# them into the base folder of that project.
# - put the .java files into a '/src/main/java/network/cow/mooapis/$NAME/$VERSION'
# folder.

# Path to where the generated buf.build files are located.
bufBuildFolder="$1"
templateFolder="$2"
targetFolder="$3"

cp -r "$bufBuildFolder/." "$targetFolder"

# Loop to get leaf folder
echo "Find services in folder $targetFolder"
for dir in $(find "$targetFolder" -type d -regex '.*v[0-9]+'); do
    parentDir="$(dirname "$dir")"

    parentDirName="$(basename "$parentDir")"
    dirName="$(basename "$dir")"

    export MOOAPIS_SERVICE_NAME="$parentDirName"
    export MOOAPIS_SERVICE_VERSION="$dirName"

    # Create /src/ folder with generated .java files
    srcFolder="$dir/src/main/java/network/cow/mooapis/$parentDirName/$dirName/"
    mkdir -p "$srcFolder"
    mv "$dir"/*.* "$srcFolder"

    # Copy and apply templates
    cp -r "$templateFolder/." "$dir"
    gomplate --input-dir "$dir" --output-dir="$dir"
    for file in $(find "$dir" -regex '.*.tmpl'); do
        mv "$file" "$(echo "$file" | sed s/.tmpl/''/)"
    done

    echo "Found $MOOAPIS_SERVICE_NAME with version $MOOAPIS_SERVICE_VERSION"
done