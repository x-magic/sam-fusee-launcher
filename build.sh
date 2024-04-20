#!/bin/bash

if [ ! -f "$1" ]; then
    echo "File in argument does not exist!"
    exit 1
fi

cd "$(dirname '$0')"

echo "===== Cleaning up old files..."
rm -rf ./main/build
rm sam-fusee-launcher.uf2

echo "===== Converting payload..."
python ./tools/binConverter.py "$1"

echo "===== Building binary.."
arduino-cli compile -e --clean -b adafruit:samd:adafruit_trinket_m0 main

echo "===== Converting binary into uf2 format..."
python ./tools/uf2conv.py -o sam-fusee-launcher.uf2 -c ./main/build/adafruit.samd.adafruit_trinket_m0/main.ino.bin

echo ="==== Ready-to-flash file is available at sam-fusee-launcher.uf2"
