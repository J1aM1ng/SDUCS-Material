.text
	sw $12, 0($10)

        # Store word also aligned
        sw $12, 3($11)

	lw $14, 0($10)
	lw $15, 3($11)
	lb $16, 3($11)

	addiu $2, $0, 10
	syscall
