
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
