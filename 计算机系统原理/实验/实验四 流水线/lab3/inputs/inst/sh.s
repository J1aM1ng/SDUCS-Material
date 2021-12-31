.text
	# Store word aligned
        sh $12, 0($10)

        # Store word also aligned
        sh $13, 2($10)

        # Store word also aligned
        sh $14, -1($11)

        # Store halfword also aligned
        sh $15, 1($11)

        # Verify memory ordering
        lw $16, 0($10)
        lw $17, -1($11)

	addiu $2, $0, 10
	syscall
