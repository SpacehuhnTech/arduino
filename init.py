#!/usr/bin/env python3

import subprocess
import shlex
import json

projects = {}

with open("projects.json") as f:
    projects = json.load(f)

def subprocess_cmd(command):
    process = subprocess.Popen(command,stdout=subprocess.PIPE, shell=True)
    proc_stdout = process.communicate()[0].strip()
    print(proc_stdout)

for project in projects:
    for package in projects[project]:
        cmd = f"""
        cd {project};
        rm -rf {package} -f;
        git clone https://github.com/SpacehuhnTech/arduino-{package} {package};
        cd {package};
        git fetch;
        git checkout {project};
        git pull;
        git submodule update --init --recursive;
        cd ..;
        cd ..;
        """

        subprocess_cmd(cmd)