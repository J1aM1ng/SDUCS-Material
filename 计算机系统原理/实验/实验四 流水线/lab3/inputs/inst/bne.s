.text
bne $8, $11, nottaken
bne $zero, $zero, nottaken
bne $9, $11, taken
addiu $2, $0, 10
syscall

nottaken:
addiu $2, $0, 10
syscall

taken:
addiu $2, $0, 10
syscall
