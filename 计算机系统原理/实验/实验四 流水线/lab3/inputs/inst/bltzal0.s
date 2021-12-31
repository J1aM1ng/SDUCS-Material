.text
bltzal $9, nottaken
addiu $2, $0, 10
syscall

nottaken: 
addiu $2, $0, 10
syscall
