.text

        sra $11, $10, 0

        # Shift away
        sra $13, $10, 16
        sra $14, $12, 16

        # Random shift
        sra $15, $10, 7

        # Don't sign extend shift
        sra $16, $11, 16

addiu $2, $0, 10
syscall

