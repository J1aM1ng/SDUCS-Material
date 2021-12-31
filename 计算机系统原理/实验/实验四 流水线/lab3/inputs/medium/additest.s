.text
addiu $t0, $0, 1234
addi $t1, $t0, 4321
addiu $t2, $0, 5555
bne $t1, $t2, bad
addiu $t8, $0, -0x8000
lui $t9, 0xffff
ori $t9, 0x8000
bne $t8, $t9, bad
j good

good:
addiu $v1, $0, 0x5678
addiu $v0, $0, 10
syscall

bad:
addiu $v1, $0, 0x1234
addiu $v0, $0, 10
syscall
