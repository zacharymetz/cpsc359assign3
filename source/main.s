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
  ldr r0, =Names
  bl printf





HaltLoop:
  b HaltLoop
