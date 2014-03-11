CC=arm-none-eabi-gcc
CXX=arm-none-eabi-g++
LD=arm-none-eabi-ld
AR=arm-none-eabi-ar
AS=arm-none-eabi-as
GDB=arm-none-eabi-gdb
OBJCOPY = arm-none-eabi-objcopy
RM      = rm -f
MKDIR	= mkdir -p

CFLAGS = -g -mthumb -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mfloat-abi=softfp
CFLAGS +=-Os -ffunction-sections -fdata-sections -MD -std=c99 -Wall
CFLAGS += -pedantic -DPART_$(MCU) -c -I$(TIVAWARE_PATH)
CFLAGS += -DTARGET_IS_BLIZZARD_RA1
CXXFLAGS = -fno-rtti -fno-exceptions -std=c++11 $(CFLAGS)
LDFLAGS = -T $(LD_SCRIPT) --entry ResetISR --gc-sections

TARGET = main
MCU = TM4C123GH6PM

C_SRC = main.c startup_gcc.c
CPP_SRC =

OUTDIR = build
TIVAWARE_PATH = ./tivaware

# LD_SCRIPT: linker script
LD_SCRIPT = $(MCU).ld

OBJECTS = $(C_SRC:%.c=$(OUTDIR)/%.o)

all: $(OUTDIR)/$(TARGET).bin

$(OUTDIR)/%.o: src/%.c | $(OUTDIR)
	$(CC) -o $@ $^ $(CFLAGS)

$(OUTDIR)/%.o: src/%.cpp | $(OUTDIR)
	$(CXX) -o $@ $^ $(CFLAGS)

$(OUTDIR)/a.out: $(OBJECTS)
	$(LD) -o $@ $^ $(LDFLAGS)

$(OUTDIR)/main.bin: $(OUTDIR)/a.out
	$(OBJCOPY) -O binary $< $@

# create the output directory
$(OUTDIR):
	$(MKDIR) $(OUTDIR)

clean:
	-$(RM) $(OUTDIR)/*

.PHONY: all clean
