.text
bgezal $8, nottaken
bgezal $9, taken1
addiu $2, $0, 10
syscall

nottaken:
addiu $2, $0, 10
syscall

taken1:
bgezal $zero, taken2
addiu $2, $0, 10
syscall

taken2:
addiu $2, $0, 10
syscall
