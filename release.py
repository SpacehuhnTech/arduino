#!/usr/bin/env python3

import sys
import os
import hashlib
import json

from os import path

if len(sys.argv) < 4:
    print("ERROR: no version specified or project")
    print("For example: ./release.sh <project> <package> <version>")
    exit()

project = sys.argv[1]
package = sys.argv[2]
version = sys.argv[3]

tag = f"{project}-{package}-{version}"

platform_file = f"{project}/{package}-platform.json"
template_file = f"{project}/{package}/platform_template.json"
zip_file = f"{project}-{package}-arduino-core-{version}.zip"

# Update version number in platform.txt
os.system(f"sed -i -e 's/X.X.X/{version}/g' {project}/{package}/platform.txt")

# ZIP it
os.system(f"cd {project} && zip -r '../{zip_file}' '{package}/' -q")

zip_size = os.path.getsize(zip_file)

zip_hash = ""

with open(zip_file, "rb") as f:
    bytes = f.read()
    zip_hash = hashlib.sha256(bytes).hexdigest()

link = f"https://github.com/spacehuhntech/arduino/releases/download/{tag}/{zip_file}"

platform_json = []

if path.exists(platform_file):
    with open(platform_file) as f:
        platform_json = json.load(f)

template_json = {}

with open(template_file) as f:
    template_json = json.load(f)

template_json["version"] = version
template_json["url"] = link
template_json["archiveFileName"] = zip_file
template_json["checksum"] = f"SHA-256:{zip_hash}"
template_json["size"] = zip_size

platform_json.append(template_json)

with open(platform_file, "w") as f:
    f.write(json.dumps(platform_json, indent=4))