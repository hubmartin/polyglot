
.thumb

@ Register addresses from STM32F0 reference manual
.equ PERIPH_BASE,           (0x40000000)
.equ AHB1PERIPH_BASE,       (PERIPH_BASE + 0x00020000)


.equ RCC_BASE ,             (AHB1PERIPH_BASE + 0x3800)
.equ RCC_AHB1ENR,			(RCC_BASE + 0x30)

.equ GPIOD_BASE, 			(AHB1PERIPH_BASE + 0x0C00)
.equ GPIOD_MODER,			(GPIOD_BASE + 0x00)
.equ GPIOD_ODR,				(GPIOD_BASE + 0x14)

@ LED PD12-15

@ Make start function global so the linker can see it later
.global _start

@ Vector table
.long               0x20001000		@ Vector #0 - Stack pointer init value (0x20000000 is RAM address and 0x1000 is 4kB size, stack grows "downwards")
.long               _start			@ Vector #1 - Reset vector - where the code begins
									@ Vector #3..#n - I don't use Systick and another interrupts right now
									@				so it is not necessary to define them and code can start here

.thumb_func				@ Force the assembler to call this function in Thumb mode, that means the least significant bit in address is set
						@ Using this bit, the ARM core knows whether is jumping to the ARM or Thumb code, Cortex supports only Thumb
						@ Also you can use ".type	_start, %function"
						
.org 0x40						
						
_start:

	@ Set SP manually
	LDR r0, =(0x20000100)
	MOV sp, r0

    @ Enable clock for GPIOC peripheral in RCC registers
    LDR r0, =(RCC_AHB1ENR)
    LDR r1, =(1 << 3)
    STR r1, [r0]     @Store R0 value to r1
   
    @ Enable GPIOC pin 9 as output
    LDR r0, =GPIOD_MODER
    LDR r1, =(1 << (12*2))	@ Every bin has 2 bit settings, hence *2
    STR r1, [r0]     @Store R0 value to r1
   
   @LDR r2, =GPIOD_ODR
   
   @ set
   @LDR r3, =(1 << 12)
   @ reset
   @LDR r3, =(0)

loop:

    @ Write high to pin PC9
    LDR r0, =GPIOD_ODR
    LDR r1, =(1 << 12)
    STR r1, [r0]     @Store R1 value to address pointed by R0
   
   
	bl delay
   
    @ Write low to PC9
    LDR r0, =GPIOD_ODR
    LDR r1, =(0)
    STR r1, [r0]     @Store R1 value to address pointed by R0

	bl delay
   
b loop
   
   


delay:
push    {r4, lr}

	@ Dummy counter to slow down my loop
    LDR R0, =0
    LDR R1, =2000000
    loop5:
    ADD R0, R0, #1
    cmp R0, R1
    bne loop5

pop     {r4, pc}

