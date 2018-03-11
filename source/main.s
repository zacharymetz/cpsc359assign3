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
  mov r0, #9 //pin
  mov r1, #1
  bl Init_GPIO

//init Latch
  mov r0, #10 //pin
  mov r1, #0
  bl Init_GPIO

//init Clock
  mov r0, #11 //pin
  mov r1, #1
  bl Init_GPIO

Init_GPIO:
  div r0, #10
  mul r0, #4

  ldr	r7, =gpioBaseAddress
  ldr	gBase, [r7]
  add gBase, gBase, r0

  mov r2, #7 //b0111







  mov pc, lr //ret





HaltLoop:
  b HaltLoop

.section .Data

  .global gpioBaseAddress
  gpioBaseAddress:
  	.int	0
