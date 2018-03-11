//This program was created by Zheyu Jeremy Ying (30002931) and Zachary Metz (30001506)

Names: //string format to print names
  .asciz  "This Program was created by Zheyu Jeremy Ying (30002931) and Zachary Metz (30001506)\n"

InputPrompt:
  .asciz "Please press a button...\n"

InputResultPre:
  .asciz "You have pressed "

JoyPadRight:
  .asciz "Joy-pad RIGHT\n"

JoyPadLeft:
  .asciz "Joy-pad LEFT\n"

JoyPadUpt:
.asciz "Joy-pad UP\n"

JoyPadDown:
  .asciz "Joy-pad DOWN\n"

ButtonX:
  .asciz "X\n"

ButtonY:
  .asciz "Y\n"

ButtonA:
  .asciz "A\n"

ButtonB:
  .asciz "B\n"

ButtonStart:
.asciz "Start\n"

ButtonSelect:
  .asciz "Select\n"

ButtonRight:
.asciz "RIGHT bumper\n"

ButtonLeft:
  .asciz "LEFT bumper\n"

.align 4
.global main
main:
  gBase	.req	r7

  ldr r0, =Names
  bl printf

  bl		getGpioPtr
	ldr		r1, =gpioBaseAddress
	str		r0, [r1]

//init Data
  mov r0, #10 //pin
  mov r1, #0
  bl Init_GPIO

//init Latch
  mov r0, #9 //pin
  mov r1, #1
  bl Init_GPIO

//init Clock
  mov r0, #11 //pin
  mov r1, #1
  bl Init_GPIO

  mov r0, #12
  bl delayMicroseconds

  b haltLoop

Init_GPIO:
  mov r3, r0 //move pin number to r3

  mov r10, #10
  sdiv r0, r10
  mov r10, #4
  mul r0, r10

  ldr	r7, =gpioBaseAddress
  ldr	gBase, [r7]
  add gBase, gBase, r0

  mov r2, #7 //b0111

  mov r10, #3
  mul r3, r10 //multiply by 3 for first bit
  lsl r2, r3
  bic gBase, r2

  mov pc, lr //ret

Read_Data:
  //mov r0, #10 //data pin
  mov r0, #1

  ldr r1, =gpioBaseAddress
  ldr r1, [r1, #52] //GPLEV0
  mov r3, #1
  lsl r3, r0 //align to Data (pin 10)
  and r1, r3 //mask everything
  teq r1, #0
  moveq r0, #0 //return 0
  movne r0, #1 //return 1

  mov pc, lr //ret


// writes a bit to the snes latch
// r1, value to write either a 1 or a 0
Write_Latch:
  //load base address
  ldr r2, =gpioBaseAddress
  mov r3, #1
  lsl r3, #9 // align bit for pin#9
  teq r1, #0
  streq r3, [r2, #40] // set set pin to 0
  Strne r3, [r2, #28] // set pin to 1

  mov pc, lr // return

// writes a bit to the snes clock
// r1, value to write either a 1 or a 0
Write_Clock:
  //load base address of pin 11
  ldr r2, =gpioBaseAddress
  add r2, 4 // add the offset
  mov r3, #1
  lsl r3, #2 // align bit for pin#11 (11-9=2)
  teq r1, #0
  streq r3, [r2, #40] // set set pin to 0
  Strne r3, [r2, #28] // set pin to 1

  mov pc, lr // return

Read_SNES:









  mov pc, lr //ret


haltLoop:
  b haltLoop

.section .Data

  .global gpioBaseAddress
  gpioBaseAddress:
  	.int	0
