.text
bgtz $zero, nottaken
bgtz $8, nottaken
bgtz $9, taken1
addiu $2, $0, 10
syscall

nottaken:
addiu $2, $0, 10
syscall

taken1:
addiu $2, $0, 10
syscall
