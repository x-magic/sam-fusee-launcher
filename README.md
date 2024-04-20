# sam-fusee-launcher
Fusee Launcher for the Adafruit Trinket M0 board. Based on [sam fusee launcher](https://github.com/atlas44/sam-fusee-launcher) and [sam fusee launcher](https://github.com/noemu/sam-fusee-launcher).

Works with Windows. Build and tested with Arduino SDK.

# Build
Go through [trinket m0: arduino-ide-setup](https://learn.adafruit.com/adafruit-trinket-m0-circuitpython-arduino/arduino-ide-setup) and [trinket m0: arduino-ide-setup2](https://learn.adafruit.com/adafruit-trinket-m0-circuitpython-arduino/using-with-arduino-ide)

The original fusee gelee demo payload is added to test your setup.

Summary:
* Download and install [Arduino IDE](http://www.arduino.cc/en/Main/Software); If you're using Linux/macOS, also install `arduino-cli`
* In Arduino IDE: go to "Prefences" and add following URL to "Additional Board Manager URLs": `https://adafruit.github.io/arduino-board-index/package_adafruit_index.json`
* go to "Tools > Board > Board Manager" and select Type: All and
* Install "Adafruit SAMD Boards" and "Arduino - Boards SAMD"
* Select the Trinket M0 with "Tools > Board > Adafruit Trinket M0"
* Go to Sketch > Include Library > Manage Libraries, Install USBHOst, Adafruit DotStar and FlashStorage.
* Open `main/main.ino` with Arduino IDE

Then Verify/Compile (Ctrl + R)

Green LED indicates power to the board. 

Red LED indicates: 
* Blinking: searching for Switch in RCM mode
* Off: board not active

DotStar LED indicates:
* Magenta: searching for Switch in RCM mode
* Red: no Switch found
* Blue: injecting payload
* Green: finished successfully

# Update the Payload
_You must install required libraries before running the automation batch script. See above for details._
* Download your favourite payload, like [CTCaer Hekate](https://github.com/CTCaer/hekate/releases/latest)
* Drag the payload bin file onto `drag-payload-on-me.bat`
* Connect the Trinket M0 and press the reset button twice
* Open the TRINKETBOOT device and copy `sam-fusee-launcher.uf2` on the device

# Hardware
[Trinket M0](https://www.adafruit.com/product/3500) with your favourite type of battery (please notice that Trinket M0 has no battery charger or power switch built-in)

[![Test](https://img.youtube.com/vi/AoL4o2NCkcM/0.jpg)](https://www.youtube.com/watch?v=AoL4o2NCkcM)

# Thanks to:
* [atlas44](https://github.com/atlas44/sam-fusee-launcher)
* [noemu](https://github.com/noemu/sam-fusee-launcher)
* [Microsoft UF2](https://github.com/microsoft/uf2/blob/master/utils/uf2conv.py)
* [ktemkin](https://github.com/Cease-and-DeSwitch/fusee-launcher)

