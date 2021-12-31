.text
bgezal $8, nottaken
addiu $2, $0, 10
syscall

nottaken:
addiu $2, $0, 10
syscall

taken1:
bgez $zero, taken2
addiu $2, $0, 10
syscall

taken2:
addiu $2, $0, 10
syscall
