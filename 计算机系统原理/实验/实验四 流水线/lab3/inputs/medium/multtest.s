.text
main:
lui $t0, 0x1234
mthi $t0
mfhi $t1
ori $t9, $0, 0xfff1
bne $t0, $t1, bad
lui $t0, 0x5678
mtlo $t0
mflo $t1
ori $t9, $0, 0xfff2
bne $t0, $t1, bad
lui $t0, 0x1234
ori $t0, $t0, 0x5678
lui $t1, 0xfedc
ori $t1, $t1, 0xba98
multu $t0, $t1
mfhi $t2
mflo $t3
lui $t4, 0x121f
ori $t4, $t4, 0xa00a
lui $t5, 0x3506
ori $t5, $t5, 0x8740
ori $t9, $0, 0xfff3
bne $t2, $t4, bad
ori $t9, $0, 0xfff4
bne $t3, $t5, bad
mult $t0, $t1
mfhi $t2
mflo $t3
lui $t4, 0xffeb
ori $t4, $t4, 0x4992
lui $t5, 0x3506
ori $t5, $t5, 0x8740
ori $t9, $0, 0xfff5
bne $t2, $t4, bad
ori $t9, $0, 0xfff6
bne $t3, $t5, bad
lui $t0, 0xfedc
ori $t0, $t0, 0xba98
ori $t1, $0, 0x5678
div $t0, $t1
mfhi $t2
mflo $t3
lui $t4, 0xffff
ori $t4, 0xe2a8
lui $t5, 0xffff
ori $t5, $t5, 0xfca2
ori $t9, $0, 0xfff7
bne $t2, $t4, bad
ori $t9, $0, 0xfff8
bne $t3, $t5, bad
divu $t0, $t1
mfhi $t2
mflo $t3
ori $t4, $0, 0xf8
lui $t5, 0x0002
ori $t5, $t5, 0xf28c
ori $t9, $0, 0xfff9
bne $t2, $t4, bad
ori $t9, $0, 0xfffa
bne $t3, $t5, bad

good:
addiu $v1, $0, 0x5678
addiu $v0, $0, 10
syscall

bad:
addiu $v1, $0, 0x1234
addiu $v0, $0, 10
syscall
