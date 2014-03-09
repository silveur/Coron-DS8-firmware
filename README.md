Tiva Template
==================

## Toolchain

You will need an ARM bare-metal toolchain to build code for Tiva targets.
You can get a toolchain from the
[gcc-arm-embedded](https://launchpad.net/gcc-arm-embedded) project that is
pre-built for your platform. Extract the package and add the `bin` folder to
your PATH.

The TivaWare package contains all of the header files and drivers for
Tiva parts. Grab the file latest software package (SW-TM4C-2.1.0.12573.exe) from
[here](http://software-dl.ti.com/tiva-c/SW-TM4C/latest/index_FDS.html) and unzip it into a directory
then run `make` to build TivaWare.

    mkdir tivaware
    cd tivaware
    unzip SW-TM4C-*.exe
    make

## Writing, Building and flashing Firmware

1. Put your code in the ./src folder

2. Run rebuildAndUpload.sh


## Credits

Thanks to Recursive Labs for their
[guide](http://recursive-labs.com/blog/2012/10/28/stellaris-launchpad-gnu-linux-getting-started/)
which this template is based on.
