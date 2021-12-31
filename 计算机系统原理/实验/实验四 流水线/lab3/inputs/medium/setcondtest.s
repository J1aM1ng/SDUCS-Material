.text
addiu $t0, $0, 10
slti $t1, $t0, 11
addiu $t8, $0, 1
bne $t1, $t8, bad
slti $t1, $t0, 10
addiu $t8, $0, 0
bne $t1, $t8, bad
slti $t1, $t0, 9
addiu $t8, $0, 0
bne $t1, $t8, bad
addiu $t0, $0, -2
slti $t1, $t0, 0
addiu $t8, $0, 1
bne $t1, $t8, bad
slti $t1, $t0, -1
bne $t1, $t8, bad
addiu $t0, $0, -1
sltiu $t1, $t0, 0
bne $t1, $0, bad
addiu $t0, $0, 42
sltiu $t1, $t0, 84
bne $t1, $t8, bad
sltiu $t1, $t0, 42
bne $t1, $0, bad
j good

good:
addiu $v1, $0, 0x5678
addiu $v0, $0, 10
syscall

bad:
addiu $v1, $0, 0x1234
addiu $v0, $0, 10
syscall
