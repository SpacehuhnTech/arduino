# WiFi Duck Board Definitions

* [WiFi Duck](https://github.com/spacehuhn/WiFiDuck)

## Boards

**WiFi Duck AVR**
* ATmega32u4
  * 5V 16MHz
  * 3.3V 8MHz
* DSTIKE WiFi Duck (ATmega32u4)

**WiFi Duck ESP8266**
* ESP8266
* ESP8285
* DSTIKE WiFi Duck (ESP8266)

## Installation 

0. Install the latest version of the [Arduino IDE](https://www.arduino.cc/en/main/software).

### Boards Manager (coming soon)

1. Start Arduino and open the Preferences window.
2. Enter `https://raw.githubusercontent.com/spacehuhn/hardware/master/wifiduck/package_wifiduck_index.json` into the *Additional Board Manager URLs* field. You can add multiple URLs, separating them with commas.
3. Open Boards Manager from Tools > Board menu and install the [boards](#boards) you need for your [project](#project).

### Git

1. Go to your Arduino sketchbook location (you can see and edit the path in the Arduino preferences).
2. Open or create a folder called `hardware`.
3. Clone this repository `git clone https://github.com/spacehuhn/hardware.git` or [download .zip](https://github.com/spacehuhn/Arduino/archive/master.zip) and extract it into the `hardware` folder. 
The resulting path should look something like this: `../Arduino/hardware/wifiduck/`.
4. Go to `hardware/wifiduck/esp8266/tools` and run `python get.py` from a terminal inside that folder.

## Credits

**Sources used to create this repository**
* [Arduino AVR Core](https://github.com/arduino/ArduinoCore-avr)
* [Sparkfun Arduino Boards](https://github.com/sparkfun/Arduino_Boards/)
* [MalDuino Boards](https://github.com/jLynx/MalDuino_Boards/)
* [ESP8266 Arduino Core](https://github.com/esp8266/Arduino)
* [Arduino SAMD Core](https://github.com/arduino/ArduinoCore-samd)
* [Adafruit SAMD Core](https://github.com/adafruit/ArduinoCore-samd)
* [Femtoduino Core for SAMD21e18a](https://github.com/femtoduino/ArduinoCore-atsamd21e18a)