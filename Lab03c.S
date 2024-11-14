.globl Lab03c

Lab03c:
  ADRP X1, ini
  ADD X1, X1, :lo12:ini // Load initial value of j (from ini)

  ADRP X2, my_array
  ADD X2, X2, :lo12:my_array // Load base address of my_array

  MOV X3, #11 // Assign i = 10 (See Register X11 for why)
  LDUR X4, [X1, #0] // Load initial value of j into X4
  ADD x4, x4, #10

LOOP: // Loop marker
  SUB X11, X3, #1 // i - 1 // i-1 starts at i==9 and ends at i==0
  LSL X5, X11, #3 // Multiply (i - 1) * 8 for the address offset
  ADD X10, X2, X5 // Add base address + offset for my_array[i-1]
  STUR X4, [X10, #0] // Store the value of j in my_array[i-1]

  SUB X4, X4, #1 // decrement j
  SUB X3, X3, #1 // Decrement i
  CBNZ X3, LOOP // If i != 0, go back to the loop

END:
  MOV X0, X10
  BR X30 // Return To Sender



  .section .data
ini: .word 6 // Initial value for j
my_array: .space 80 // Reserve space for 10 * 8 = 80 Bytes

