        # Basic branch test
	.text

main:
        addiu $v0, $zero, 0xa
l_0:    
        j l_1
l_1:
        bne $zero, $zero, l_3
l_2:
        beq $zero, $zero, l_4
        addiu $7, $zero, 0x347
        syscall
l_3:
	addiu $7, $zero, 0x1337
        # Should not reach here
l_4:
        addiu $7, $zero, 0xd00d
        syscall
        
         
        
