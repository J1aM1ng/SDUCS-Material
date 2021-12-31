.text

        # Zero shift
        sll $11, $10, 0

        # Shift away
        sll $12, $10, 16
        sll $13, $12, 16

        # Random shift
        sll $14, $10, 7

addiu $2, $0, 10
syscall

