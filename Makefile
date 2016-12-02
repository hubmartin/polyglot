

# This makefile only connects 3 binaries to one final BIN and HEX
# You have to recompile each project manually

# Paths to compiled binaries
AVR_BIN = Arduino_AVR/polyglot.bin
X51_BIN = 8051/main.bin
ARM_BIN = ARM_STM32F4_Discovery/main.bin

# Reset vectors
AVR_HEADER = $(AVR_BIN) -binary -crop 0x00 0x02
X51_HEADER = $(X51_BIN) -binary -crop 0x02 0x04
ARM_HEADER = $(ARM_BIN) -binary -crop 0x04 0x08

# Assembly code
AVR_CODE = $(AVR_BIN) -binary -crop 0x20 0x100
X51_CODE = $(X51_BIN) -binary -crop 0x10 0x200
ARM_CODE = $(ARM_BIN) -binary -crop 0x40 0x200

OUT = -o polyglot_combined.bin -binary
# -o polyglot_combined.hex -intel

all:
	srec_cat $(AVR_HEADER) $(X51_HEADER) $(ARM_HEADER) $(AVR_CODE) $(X51_CODE) $(ARM_CODE) $(OUT)
	srec_cat polyglot_combined.bin -binary -offset 0x00 -o polyglot_combined.hex -intel