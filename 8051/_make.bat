as31 main.asm
makebin -p < main.hex > main.bin
srec_cat main.bin -binary -offset 0x00 -o output.hex -intel
pause
