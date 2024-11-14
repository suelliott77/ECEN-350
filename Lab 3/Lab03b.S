.globl Lab03b

Lab03b:
  ADRP X1, UIN
  ADD X1,X1, :lo12:UIN // Unload the address of UIN
  LDRB W2, [X1, #0] // Load Address of UIN into X2
  MOV X0, #10 // Set X0 == 10

  L1:
  SUB X0, X0, #1 // Decrement i
  SUB X2, X2, #1 // Decrement UIN
  STRB W2, [X1, #0] // Store UIN into UIN Address
  CBNZ X0, L1 // if i != 0, Return to Marker L1
  MOV X0, X2
  BR X30 // Return To Sender

.section .data
  UIN: .byte 20
