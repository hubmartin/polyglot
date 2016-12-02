# Polyglot running on AVR, ARM and 8051

One binary to rule them all.

Follow this project for future explaining video and further development.

This project was created and added to the 1kB challenge as a proof of concept. Because the 1kB challenge could use any architecture and 1kB code - it brought to me the idea of creating single binary file which would run on many architectures.

Right now there's only blinking LED demo for each architecture. In a few days I'll add more explanation of some tricks I used to deal with a fact that AVR and 8051 have the same reset vetor at address 0x0000.

This polyglot can be improved to share some kind of common data across all architectures. For example you can code brainfuck interpreter for every architecture and use common data space where the brainfuck program will be located. So you end with like 4 interpreters in one binary and one data segment where is the actual program which will run really cross-platform.

In software world there are some projects that are trying to create a single polyglot file which could be opened as PDF, JPG, ZIP archive ... But I wasn't be able to find anything similar in embedded world.

Project idea was started based on 1kB Hack a Day challenge.
https://hackaday.io/contest/18215-the-1kb-challenge
