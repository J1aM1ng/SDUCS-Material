.text
addiu $t0, $0, 10
addiu $t1, $0, 11
beq $t0, $t1, bad
addiu $t1, $0, 10
beq $t0, $t1, good
j bad

good:
addiu $v1, $0, 0x5678
addiu $v0, $0, 10
syscall

bad:
addiu $v1, $0, 0x1234
addiu $v0, $0, 10
syscall
