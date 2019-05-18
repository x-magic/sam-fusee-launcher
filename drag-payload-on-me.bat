@ECHO OFF
SET arduinoroot=C:\Softwares\arduino
SET python3root=C:\Python37\python.exe

@ECHO ===== Cleaning up old files...
rmdir /s /q build
del sam-fusee-launcher.uf2

@ECHO ===== Converting payload...
"%python3root%" .\tools\binConverter.py %1

@ECHO ===== Building binary...
mkdir build
"%arduinoroot%\arduino-builder.exe"^
 -compile^
 -hardware %arduinoroot%\hardware^
 -hardware %arduinoroot%\portable\packages^
 -tools %arduinoroot%\tools-builder^
 -tools %arduinoroot%\portable\packages^
 -libraries %arduinoroot%\portable\sketchbook\libraries^
 -fqbn=adafruit:samd:adafruit_trinket_m0^
 -build-path .\build^
 .\main\main.ino

@ECHO ===== Converting binary into uf2 format...
"%python3root%" .\tools\uf2conv.py -o sam-fusee-launcher.uf2 -c .\build\main.ino.bin

pause