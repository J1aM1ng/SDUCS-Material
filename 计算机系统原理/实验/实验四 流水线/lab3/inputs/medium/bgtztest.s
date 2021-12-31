.text
addiu $t0, $0, 10
bgtz $t0, foo
j bad
foo:
addiu $t0, $0, 0
bgtz $t0, bad
addiu $t0, $0, -10
bgtz $t0, bad
j good

good:
addiu $v1, $0, 0x5678
addiu $v0, $0, 10
syscall

bad:
addiu $v1, $0, 0x1234
addiu $v0, $0, 10
syscall
