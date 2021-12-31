.text
        # Store byte
        sb $11, 0($10)

        # Store byte
        sb $12, 1($10)

        # Store byte
        sb $13, 2($10)

        # Store byte
        sb $14, 3($10)

        # Verify memory ordering
        lw $15, 0($10)

	addiu $2, $0, 10
	syscall
