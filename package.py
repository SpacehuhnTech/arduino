#!/usr/bin/env python3

import os.path
from os import path

import json

projects = {}

with open("projects.json") as f:
    projects = json.load(f)

index_json = {
    "packages": []
}

for i, project in enumerate(projects):
    # Meta data
    project_json = {
        "name": project,
        "maintainer": "Spacehuhn Technologies",
        "websiteURL": "https://spacehuhn.tech",
        "email": "support@spacehuhn.tech",
        "help": {
            "online": f"https://github.com/spacehuhntech",
        },
        "platforms": [],
        "tools": [],
    }
    
    # Platforms
    for package in projects[project]:
        platform_file = f"{project}/{package}-platform.json"
        
        if path.exists(platform_file):
            with open(platform_file) as f:
                platforms = json.load(f)
                for p in platforms:
                    project_json["platforms"].append(p)

        # Tools
        tools_file = f"{project}/{package}/tools.json"
        with open(tools_file) as f:
            tools = json.load(f)
            for t in tools:
                project_json["tools"].append(t)

    index_json["packages"].append(project_json)

with open("package_spacehuhn_index.json", "w") as f:
    f.write(json.dumps(index_json, indent=4))