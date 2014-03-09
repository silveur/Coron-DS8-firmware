#!/bin/bash 

echo "----------Building new firmware----------"
make clean
make || echo "Build failed"
./Utilities/lm4flash ./build/main.bin -s /dev/tty.usbmodem0E200211 || exit 1
