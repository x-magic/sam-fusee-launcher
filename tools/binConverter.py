import sys
import binascii
import os


def printProgressBar(progress):
    i = int(progress * 20)
    sys.stdout.write('\r')
    sys.stdout.write("[%-20s] %d%%" % ('='*i, 5*i))
    sys.stdout.flush()

def openFileToByte_generator(filename , chunkSize = 128):
    fileSize = os.stat(filename).st_size
    readBytes = 0.0
    with open(filename, "rb") as f:
        while True:
            chunk = f.read(chunkSize)
            #print(type(chunk))
            readBytes += chunkSize
            printProgressBar(readBytes/float(fileSize))
            if chunk:
                for byte in chunk:
                    if sys.version_info[0] < 3:
                        yield byte
                    else:
                        yield byte.to_bytes(1, byteorder='big')
            else:
                break


if(len(sys.argv) != 2):
	sys.exit('Usage: binConverter.py "payload.bin"')

fileIn = sys.argv[1]


base = os.path.splitext(fileIn)[0]
fileOut =  "./main/payload.h"

stringBuffer = "\t"
countBytes = 0
print("Reading file: " + fileIn)

for byte in openFileToByte_generator(fileIn,16):
    countBytes += 1
    stringBuffer += "0x"+binascii.hexlify(byte).decode('ascii')+", "
    if countBytes%16 == 0:
    	stringBuffer += "\n\t"



stringBuffer = "#include <Arduino.h> \n//" + os.path.basename(fileIn) + "\n#define FUSEE_BIN_SIZE " + str(countBytes) + "\nconst PROGMEM byte fuseeBin[FUSEE_BIN_SIZE] = {\n" + stringBuffer + "\n};"

print("\nWriting file: " + fileOut)
text_file = open(fileOut, "w")
text_file.write(stringBuffer)
text_file.close()

print("Finished")