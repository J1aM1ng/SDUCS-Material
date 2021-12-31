.text
lui $a0, 0x1000

lui $t0, 0x0102
ori $t0, $t0, 0x0304
sw $t0, 0($a0)
lb $t4, 0($a0)
addiu $t5, $0, 4
ori $t9, $0, 0xfff0
bne $t4, $t5, bad
lb $t4, 1($a0)
addiu $t5, $0, 3
ori $t9, $0, 0xfff1
bne $t4, $t5, bad
lb $t4, 2($a0)
addiu $t5, $0, 2
ori $t9, $0, 0xfff2
bne $t4, $t5, bad
lb $t4, 3($a0)
addiu $t5, $0, 1
ori $t9, $0, 0xfff3
bne $t4, $t5, bad
lh $t4, 0($a0)
addiu $t5, $0, 0x0304
ori $t9, $0, 0xfff4
bne $t4, $t5, bad
lh $t4, 2($a0)
addiu $t5, $0, 0x0102
ori $t9, $0, 0xfff5
bne $t4, $t5, bad

addiu $t4, $0, 5
sb $t4, 0($a0)
addiu $t4, $0, 7
sb $t4, 2($a0)
lw $t4, 0($a0)
lui $t6, 0x0107
ori $t6, $t6, 0x0305
ori $t9, $0, 0xfff6
bne $t4, $t6, bad
ori $t4, $0, 0xfffe
sh $t4, 2($a0)
lw $t4, 0($a0)
lui $t6, 0xfffe
ori $t6, $t6, 0x0305
ori $t9, $0, 0xfff7
bne $t4, $t6, bad

addiu $t4, $0, 0xff
sb $t4, 0($a0)
lb $t4, 0($a0)
lui $t6, 0xffff
ori $t6, $t6, 0xffff
ori $t9, $0, 0xfff8
bne $t4, $t6, bad
lbu $t4, 0($a0)
addiu $t6, $0, 0xff
ori $t9, $0, 0xfff9
bne $t4, $t6, bad
ori $t4, $0, 0xffff
sw $t4, 0($a0)
lh $t4, 0($a0)
lui $t6, 0xffff
ori $t6, $t6, 0xffff
ori $t9, $0, 0xfffa
bne $t4, $t6, bad
lhu $t4, 0($a0)
ori $t6, $0, 0xffff
ori $t9, $0, 0xfffb
bne $t4, $t6, bad

good:
addiu $v1, $0, 0x5678
addiu $v0, $0, 10
syscall

bad:
addiu $v1, $0, 0x1234
addiu $v0, $0, 10
syscall
