.text
xori $10, $zero, 0x0001
xori $10, $zero, 0x0005
xori $9, $10, -0x0002
xori $8, $9, -0x0009
addiu $2, $0, 10
syscall

