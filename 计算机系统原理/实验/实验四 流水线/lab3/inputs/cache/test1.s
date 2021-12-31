.text
    lui $s0, 0x1000 # data memory: 0x10000000

    lui $t0, 1 # loop count: 0x10000
Loop:
    sll $t1, $t0, 2
    addu $t1, $t1, $s0
    sw $t0, 0($t1) # cache miss every 8 iterations
    sw $t0, 4($t1) # never a cache miss: trails first store in descending stream
    addiu $t0, $t0, -1
    bne $t0, $0, Loop

    addiu $v0, $0, 10
    syscall
