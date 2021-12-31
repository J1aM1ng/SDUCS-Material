.text
lui   $2, 0x1000
lui   $3, 0x5050
ori   $3, $3, 0x5050 
addiu $4, $0, 100

loading:
sw    $3, 0($2)
addiu $2, $2, 4
addiu $4, $4, -1
bne   $4, $0, loading

addiu $2, $0, 400
lui   $3, 0x1000
ori   $4, $3, 0x1000

CopyLoop:
lb    $5, 0($3)
sb    $5, 0($4)
addiu $3, $3, 1
addiu $4, $4, 1
addiu $2, $2, -1
bne   $2, $0, CopyLoop

addiu $2, $0, 100
lui   $3, 0x5050
ori   $3, $3, 0x5050
lui   $4, 0x1000
ori   $4, $4, 0x1000

CheckLoop:
lw    $5, 0($4)
bne   $5, $3, Bad
addiu $4, $4, 4
addiu $2, $2, -1
bne   $2, $0, CheckLoop 
j     Finish     

Bad:
addiu $10, 0xbaadbaad

Finish:
addiu $2, $0, 10
syscall
