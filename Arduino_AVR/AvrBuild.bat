@ECHO OFF
"C:\Program Files (x86)\Atmel\AVR Tools\AvrAssembler2\avrasm2.exe" -S "C:\Users\hp\Dropbox\Bckup\Dev\polyglot\avr\labels.tmp" -fI -W+ie -C V2E -o "C:\Users\hp\Dropbox\Bckup\Dev\polyglot\avr\polyglot.hex" -d "C:\Users\hp\Dropbox\Bckup\Dev\polyglot\avr\polyglot.obj" -e "C:\Users\hp\Dropbox\Bckup\Dev\polyglot\avr\polyglot.eep" -m "C:\Users\hp\Dropbox\Bckup\Dev\polyglot\avr\polyglot.map" -l "C:\Users\hp\Dropbox\Bckup\Dev\polyglot\avr\polyglot.lst" "C:\Users\hp\Dropbox\Bckup\Dev\polyglot\avr\polyglot.asm"
hex2bin polyglot.hex
