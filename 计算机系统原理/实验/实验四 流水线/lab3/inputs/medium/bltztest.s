.text
addiu $t0, $0, 10
bltz $t0, bad
addiu $t0, $0, -10
bltz $t0, foo
j bad
foo:
addiu $t0, $0, -10
ra_label:
bltzal $t0, foo2
bltzal_r:
j bad
foo2:
add $t0, $ra, $0
jal foo3
foo3:
addi $ra, $ra, -12 # 4 * (foo3 - bltzal_r)
bne $ra, $t0, bad
bgezal $0, foo4
bgezal_r:
j bad
foo4:
add $t0, $ra, $0
jal foo5
foo5:
addi $ra, $ra, -12 # 4 * (foo5 - bgezal_r)
bne $ra, $t0, bad
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
