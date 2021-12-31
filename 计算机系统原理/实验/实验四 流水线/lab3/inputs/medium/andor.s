.text
lui $t0, 0x1234
ori $t0, $t0, 0x5678
addiu $t1, $0, 0x1234
sll $t1, $t1, 16
addiu $t1, $t1, 0x5678
bne $t0, $t1, bad
lui $t0, 0xffff
ori $t1, $0, 0xffff
or $t2, $t0, $t1
lui $t3, 0xffff
ori $t3, $t3, 0xffff
bne $t2, $t3, bad
and $t2, $t0, $t1
bne $t2, $0, bad
lui $t3, 0xffff
ori $t3, $t3, 0xffff
andi $t3, $t3, 0xffff
ori $t4, $0, 0xffff
bne $t3, $t4, bad
nor $t4, $t4, $0
lui $t5, 0xffff
bne $t4, $t5, bad
xori $t5, $t5, 0xffff
lui $t6, 0xffff
ori $t6, $t6, 0xffff
bne $t5, $t6, bad
j good

good:
addiu $v1, $0, 0x5678
addiu $v0, $0, 10
syscall

bad:
addiu $v1, $0, 0x1234
addiu $v0, $0, 10
syscall
