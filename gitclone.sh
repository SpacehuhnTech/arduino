#!/bin/bash

# Clone Deauther Repos

cd deauther

rm -rf esp8266 -f
git clone --recursive https://github.com/SpacehuhnTech/arduino-esp8266 esp8266
cd esp8266
git fetch
git checkout deauther
git pull
cd ..

cd ..


# Clone WiFi Duck Repos

cd wifiduck

rm -rf esp8266 -f
git clone --recursive https://github.com/SpacehuhnTech/arduino-esp8266 esp8266
cd esp8266
git fetch
git checkout wifiduck
git pull
cd ..

rm -rf avr -f
git clone --recursive https://github.com/spacehuhntech/arduino-avr avr
cd avr
git fetch
git checkout wifiduck
git pull
cd ..

rm -rf samd -f
git clone --recursive https://github.com/spacehuhntech/arduino-samd samd
cd samd
git fetch
git checkout wifiduck
git pull
rm -rf samd/cores/arduino/TinyUSB/ -f
cd ..

cd ..