.text

        # Store word aligned
        sw $12, 0($10)

        # Load word aligned
        lh $13, 0($10)

        # Load word also aligned
        lh $14, 2($10)

        # Load word also aligned
        lh $15, 1($11)

        # Load word also aligned
        lh $16, -1($11)

	addiu $2, $0, 10
	syscall
