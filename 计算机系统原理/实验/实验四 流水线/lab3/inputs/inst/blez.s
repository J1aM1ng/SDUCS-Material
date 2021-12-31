.text
blez $9, nottaken
blez $zero, taken1
addiu $2, $0, 10
syscall

nottaken:
addiu $2, $0, 10
syscall

taken1:
blez $8, taken2
addiu $2, $0, 10
syscall

taken2: 
addiu $2, $0, 10
syscall

