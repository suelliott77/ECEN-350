.globl lab04b

lab04b:
	// x0 == (n-x)
	// X1 == (n-x)

	SUB SP,SP,#16 // make space on the stack 
	STUR X1,[SP,#0] // store X1 in bytes 0-7
	STUR X30,[SP,#8]  // store X30 in bytes 8-15
	CBZ X0, ZERO // check for if it is already 0

	MOV X1,X0 //Store X0 in X1
	SUB X0,X0,#1 // X0-=1
	CBZ X0,ZERO // IF X0 == 0, ZERO
	BL lab04b // Call Function Again.
	BL my_mul // Multiply X0, X1
	B END
ZERO:
	ORR X0,XZR,#1

END:
	LDUR X1,[SP,#0] // load bytes 0-7
	LDUR X30,[SP,#8] // load bytes 8-15
	ADD SP,SP,#16 // replace space on the stack
	BR X30 // return