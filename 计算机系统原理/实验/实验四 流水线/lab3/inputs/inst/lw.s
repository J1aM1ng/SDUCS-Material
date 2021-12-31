.text

	# Store word aligned
        sw $12, 0($10)

        # Store word also aligned
        sw $12, 3($11)

        # Load word aligned
        lw $13, 0($10)

        # Load word also aligned
        lw $14, 3($11)

	addiu $2, $0, 10
	syscall
