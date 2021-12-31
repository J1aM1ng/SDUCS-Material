.text
bltzal $9, nottaken
bltzal $zero, nottaken
bltzal $8, taken
addiu $2, $0, 10
syscall

taken: 
addiu $2, $0, 10
syscall

nottaken:
addiu $2, $0, 10
syscall
