.text
ori $10, $zero, 0x0001
ori $10, $zero, 0x0005
ori $9, $10, -0x0002
ori $8, $9, -0x0009
addiu $2, $0, 10
syscall

