# WiFi Duck Board Definitions

* [WiFi Duck](https://github.com/spacehuhn/WiFiDuck)

## Boards

**WiFi Duck AVR**
* DSTIKE WiFiDuck
* ATmega32u4
* Arduino Leonardo
* Arduino Micro
* Sparkfun Pro Micro
* CJMCU Beetle
* SS Micro

**WiFi Duck ESP8266**
* DSTIKE WiFi Duck
* Generic ESP8266 Module
* Generic ESP8285 Module
* NodeMCU 1.0 (ESP-12E Module)
* LOLIN(WEMOS) D1 Mini
* LOLIN(WEMOS) D1 Mini Pro
* LOLIN(WEMOS) D1 Mini Lite
			
* ESP8266
* ESP8285
* DSTIKE WiFi Duck (ESP8266)

## Installation 

0. Install the latest version of the [Arduino IDE](https://www.arduino.cc/en/main/software).

### [Coming Soon!] Boards Manager Method (recommended)

1. Start Arduino and open the Preferences window.
2. Enter `https://raw.githubusercontent.com/spacehuhn/hardware/master/wifiduck/package_wifiduck_index.json` into the *Additional Board Manager URLs* field. You can add multiple URLs, separating them with commas.
3. Go to `Tools` > `Board` > `Board Manager`, search for `wifi duck` and install `WiFi Duck AVR Boards` and `WiFi Duck ESP8266 Boards`.

### Git Method

1. [Install the ESP8266 Arduino Core](https://github.com/esp8266/Arduino#installing-with-boards-manager) - You will need the tools it installes.
2. Go to your Arduino sketchbook location (you can see and edit the path in the Arduino preferences).
3. Clone this repository `git clone https://github.com/spacehuhn/hardware.git` or [download .zip](https://github.com/spacehuhn/Arduino/archive/master.zip), extract and rename it to `hardware`. 
The resulting path should look something like this: `../Arduino/hardware/wifiduck/esp8266/...`.
4. Go to `Tools` > `Board` > `Board Manager`, search for `samd` and install the `Arduino SAMD Boards`

## Credits

**Sources used to create this repository**
* [Arduino AVR Core](https://github.com/arduino/ArduinoCore-avr)
* [Sparkfun Arduino Boards](https://github.com/sparkfun/Arduino_Boards/)
* [MalDuino Boards](https://github.com/jLynx/MalDuino_Boards/)
* [ESP8266 Arduino Core](https://github.com/esp8266/Arduino)
* [Arduino SAMD Core](https://github.com/arduino/ArduinoCore-samd)
* [Adafruit SAMD Core](https://github.com/adafruit/ArduinoCore-samd)
* [Femtoduino Core for SAMD21e18a](https://github.com/femtoduino/ArduinoCore-atsamd21e18a)