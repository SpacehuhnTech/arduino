#!/bin/bash

# Constants
projects=( "deauther/esp8266" "wifiduck/avr" "wifiduck/samd" "wifiduck/esp8266" )
packagefile="package_spacehuhntech_index.json"

# Build package.json
header=$(cat << EOM
    {
    "packages": [
      {
        "name": "spacehuhn",
        "maintainer": "Spacehuhn Technologies",
        "websiteURL": "https://spacehuhn.tech",
        "email": "support@spacehuhn.tech",
        "help": {
          "online": "https://github.com/spacehuhntech/arduino"
        },
        "platforms": [
EOM
)

connector=$(cat << EOM
    ],
        "tools": [
EOM
)

footer=$(cat << EOM
        ]
      }
    ]
  }
EOM
)

echo "$header" > "$packagefile"

start=true
for i in "${projects[@]}"
do
  if [ -f "$i-platform.json" ]
  then
    if [ "$start" = true ]
    then
      start=false
    else
      echo "," >> "$packagefile"
    fi
    cat "$i-platform.json" >> "$packagefile"
  fi
done

echo "$connector" >> "$packagefile"

start=true
for i in "${projects[@]}"
do
  if [ -f "$i/tools.json" ]
  then
    if [ "$start" = true ]
    then
      start=false
    else
      echo "," >> "$packagefile"
    fi
    cat "$i/tools.json" >> "$packagefile"
  fi
done

echo "$footer" >> "$packagefile"

output=$(python -m json.tool "$packagefile")
echo "$output" > "$packagefile"

echo "Done :)"