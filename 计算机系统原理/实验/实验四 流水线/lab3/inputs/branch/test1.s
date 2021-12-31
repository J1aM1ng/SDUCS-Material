.text
    addiu $t0, 100
    addiu $s0, $0, 0
Loop:
    addiu $t1, $0, 3
    addiu $t2, $0, 5
    addiu $t3, $0, 17
    div $t0, $t1
    nop
    mfhi $t4
    bne $t4, $0, T1
    addiu $s0, $s0, 1
T1: div $t0, $t2
    nop
    mfhi $t4
    bne $t4, $0, T2
    addiu $s0, $s0, 1
T2: div $t0, $t3
    nop
    mfhi $t4
    bne $t4, $0, T3
    addiu $s0, $s0, 1
T3: addiu $t0, $t0, -1
    bne $t0, $0, Loop
    addiu $v0, $0, 10
    syscall
