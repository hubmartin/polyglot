

.include "m168def.inc" 

.def delay1	= r17
.def delay2	= r18
.def delayv	= r19
.equ led	= 5 ; PORTD bit number to blink LED on

.org 0x0000

	;rjmp main		;0xC0
	;rcall main		; 0xDx xx instruction
	brid main		; makes 0xCF and 0xF4 assembly 8051 instructions which are harmless
					; 0xCF - XCH A,R7 	(exchange bytes)
					; 0xF4 - CPL A		(complement register)

.org 0x010

delay:
	clr	delay1 
	clr	delay2
	ldi	delayv, 30
      
delay_loop: 
	dec	delay2		
	brne	delay_loop 	
	dec	delay1		
	brne	delay_loop 	
	dec	delayv		
	brne	delay_loop 	
	ret     		; go back to where we came from


main:
	sbi	DDRB, led	; connect PORTD pin 4 to LED

loop:
	cbi	PORTB, led	; turn PD4 high
	rcall	delay		; delay for an short bit
	sbi	PORTB, led	; turn PD4 low 
	rcall	delay		; delay again for a short bit
	rjmp	loop		; recurse back to the head of loop

