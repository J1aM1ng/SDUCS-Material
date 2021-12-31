.text

        # Store word aligned
        sw $11, 0($10)

        # Load byte
        lbu $12, 0($10)

        # Load byte
        lbu $13, 1($10)

        # Load byte
        lbu $14, 2($10)

        # Load byte
        lbu $15, 3($10)

	addiu $2, $0, 10
	syscall
