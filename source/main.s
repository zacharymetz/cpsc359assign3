//This program was created by Zheyu Jeremy Ying (30002931) and Zachary Metz (30001506)


@ Data section
.section    .data


Names: //string format to print names
  .asciz  "This Program was created by Zheyu Jeremy Ying (30002931) and Zachary Metz (30001506)"

InputPrompt:
  .asciz "Please press a button...\n"

InputResultPre:
  .asciz "You have pressed "

JoyPadRight:
  .asciz "Joy-pad RIGHT"

JoyPadLeft:
  .asciz "Joy-pad LEFT"

JoyPadUpt:
.asciz "Joy-pad UP"

JoyPadDown:
  .asciz "Joy-pad DOWN"

ButtonX:
  .asciz "X"
ButtonY:
  .asciz "Y"

ButtonA:
  .asciz "A"

ButtonB:
  .asciz "B"

ButtonStart:
.asciz "Start"

ButtonSelect:
  .asciz "Select"

ButtonRight:
.asciz "RIGHT bumper"

ButtonLeft:
  .asciz "LEFT bumper"









@ Code section
.section    .text

.align 4
.global main
main:
