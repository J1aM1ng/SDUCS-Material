   lui $t0, 0x0010

   addiu $t1, 2
   addiu $t2, 3
L1:
   addu $t3, $t1, $t2
   addiu $t1, $t2, 0
   addiu $t2, $t3, 0
   addiu $t0, $t0, -1
   bne $t0, $0, L1

   addiu $v0, $0, 10
   syscall
