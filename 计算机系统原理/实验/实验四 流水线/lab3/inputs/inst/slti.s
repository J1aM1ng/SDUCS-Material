.text
slti $3, $zero, 0x7fff
slti $4, $zero, 0x0000
slti $5, $zero, -0x8000
slti $6, $8, 0xffff
slti $20, $8, 0x4
slti $21, $11, -0x4
slti $22, $11, 0xfff 
addiu $2, $0, 10
syscall

