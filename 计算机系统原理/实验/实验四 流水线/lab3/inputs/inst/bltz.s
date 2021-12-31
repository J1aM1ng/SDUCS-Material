.text
bltz $9, nottaken
bltz $zero, nottaken
bltz $8, taken
addiu $2, $0, 10
syscall

nottaken:
addiu $2, $0, 10
syscall

taken: 
addiu $2, $0, 10
syscall
