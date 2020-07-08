#!/bin/bash

if [ $# -lt 3 ]
then
    echo "ERROR: no version specified or project"
    echo "For example: ./release.sh <project> <package> <version>"
    exit 1
fi

# Constants
project=$1
package=$2
version=$3
tag="$project-$package-$version"
platform_file="$package-platform.json"
#tool_file="$package/tools.json"
template_file="$package/platform_template.json"
zip_file="$project-$package-arduino-core-$version.zip"

cd "$project"

# Check history for version number
if grep -q "\"version\": \"$version\"" $platform_file
then
    echo "ERROR: version $version already exists"
    exit 2
else
    echo "Building $project $package arduino core version $version"
fi

# Update version number in platform.txt
sed -i -e "s/version=X.X.X/version=$version/g" "$package/platform.txt"

# ZIP it
zip -r "../$zip_file" "$package/" -q

# Reset version number in platform.txt
#rm "$package/platform.txt"
#mv "$package/platform.txt-e" "$package/platform.txt"

# Get file size
size=$(wc -c < "../$zip_file" | awk '{$1=$1};1')

# Hash
hash=$(shasum -a 256 "../$zip_file" | cut -d ' ' -f 1)

# Generate link
link="https://github.com/spacehuhntech/arduino/releases/download/$tag/$zip_file"

# Build platform_file.json
platform=$(cat "$template_file")
platform="${platform/__VERSION__/$version}"
platform="${platform/__LINK__/$link}"
platform="${platform/__FILENAME__/$zip_file}"
platform="${platform/__HASH__/$hash}"
platform="${platform/__SIZE__/$size}"

# Build platform_file.json
if [ -s $platform_file ]
then
    echo "," >> $platform_file
fi

echo "$platform" >> $platform_file

echo "Tag: $tag, File: $zip_file"