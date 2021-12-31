.text

        srl $11, $10, 0

        # Shift away
        srl $13, $10, 16
        srl $14, $12, 16

        # Random shift
        srl $15, $10, 7

        # Don't sign extend shift
        srl $16, $11, 16

addiu $2, $0, 10
syscall

