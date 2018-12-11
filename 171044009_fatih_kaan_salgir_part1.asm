		load R5,3			;given number
		load R2,1			;constant for increasing
		load R6,-1			;constant for decrasing

		move R0,R5
		move R7,R5
		
decrase:	move R5,R7			;use the answer of previous multiplication
		load R3,0			;reset R0
		load R7,0			;reset R7
		jmpEQ R2=R0, digit
		addi R0,R0,R6			;decrase 1
		jmp multiply


multiply:	addi R7,R7,R5
		addi R3,R3,R2			;counter for how many times multiplied
		jmpEQ R3=R0, decrase
		jmp multiply

digit:		load R0,99			;changes to loop10 if there are no hunderds
		load R6,-10			;constant for decrasing 10
		load R3,1			;constant for increasing 1
		load R7,-100			;constant for decreasing 100

loop100:	jmpLE R5<=R0 ,chngeCompre
		addi R5,R5,R7			;decrease 100
		addi R8,R8,R3			;counter until there are no hundreds	
		jmp loop100

chngeCompre:	load R0,9
		jmp loop10
	
loop10:		jmpLE R5<=R0, display
		addi R5,R5,R6			;decrase 10
		addi R9,R9,R3			;counter until there are no tens
		jmp loop10

display:		load R0,48			;converts decimial to accii
		addi R5,R5,R0			;ones		
		addi R9,R9,R0			;tens
		addi R8,R8,R0			;hunderds
		move RF,R8			;display hundreds
		move RF,R9			;display tens
		move RF,R5			;display ones

		halt
