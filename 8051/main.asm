
  
 ; P1.4 pin PLCC #6 vyveden na konektor
  ; DS49C450 command
  ; K -erase flash
  ; L - load flash
  
  
.org    0
.byte 0xCF
.byte 0xF4

sjmp START
  
  .org 0x10
START: 
		CPL P1.4
       ;ACALL WAIT  
	   
	   WAIT:  MOV R4,#05H
WAIT1: MOV R3,#00H
WAIT2: MOV R2,#00H
WAIT3: DJNZ R2,WAIT3
        DJNZ R3,WAIT2
        DJNZ R4,WAIT1
	   
       SJMP START

;WAIT:  MOV R4,#05H
;WAIT1: MOV R3,#00H
;WAIT2: MOV R2,#00H
;WAIT3: DJNZ R2,WAIT3
;        DJNZ R3,WAIT2
;        DJNZ R4,WAIT1
;        RET
