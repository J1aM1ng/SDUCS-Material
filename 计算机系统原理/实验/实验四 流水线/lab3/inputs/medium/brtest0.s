        # Basic branch test
	.text

main:
        addiu $v0, $zero, 0xa
l_0:    
        addiu $5, $zero, 1
        j l_1
        addiu $10, $10, 0xf00
        ori $0, $0, 0
        ori $0, $0, 0
        addiu $5, $zero, 100
        syscall        
l_1:
        bne $zero, $zero, l_3
        ori $0, $0, 0
        ori $0, $0, 0
        addiu $6, $zero, 0x1337
l_2:
        beq $zero, $zero, l_4
        ori $0, $0, 0
        ori $0, $0, 0
        # Should not reach here
        addiu $7, $zero, 0x347
        syscall
l_3:
        # Should not reach here
        addiu $8, $zero, 0x347
        syscall
l_4:
        addiu $7, $zero, 0xd00d
        syscall
        
         
        
