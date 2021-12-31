    .text
main:
    lui $s0, 0x1000 # primes array at 0x10000000

    # initialize primes[i] = 1 for i = 0 .. 2^16
    lui $t0, 1
    ori $t1, $0, 1
    addiu $t3, $0, 0
zeroloop:
    addu $t2, $s0, $t3
    sb $t1, 0($t2)
    addiu $t3, $t3, 1
    bne $t3, $t0, zeroloop

    # outer loop: over i = 2..256 (index = $t0, limit = $t1)
    ori $t0, $0, 2
    ori $t1, $0, 257
outerloop:
    # inner loop: over j = 2*i..65536 by i (index = $t2, limit = $t3)
    sll $t2, $t0, 1 # j=2*i
    lui $t3, 1
innerloop:
    # set primes[j] = 0
    addu $t4, $t2, $s0
    sb $0, 0($t4)

    # j += i; innerloop
    add $t2, $t2, $t0
    # loop if j < 65536
    sub $t4, $t3, $t2
    bgtz $t4, innerloop
    # i++; outerloop
    addiu $t0, $t0, 1
    bne $t0, $t1, outerloop

    # find the 5000th prime (should be 48611)
    addiu $t0, $s0, 1 # ptr into primes array (start at primes[1] -> first probe at 2)
    addiu $t1, $0, 5000 # count down as we see primes
primeloop:
    addiu $t0, $t0, 1 # next array elem
    lbu $t2, 0($t0)
    beq $t2, $0, primeloop # not prime? continue
    addiu $t1, $t1, -1 # prime: decrement counter
    bne $t1, $0, primeloop # keep looking if not at 5000th prime

    # find index of 5000th prime: ptr - array base
    subu $t3, $t0, $s0

    # done!
    addiu $v0, $0, 10
    syscall

