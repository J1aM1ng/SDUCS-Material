.text
jal foo
addiu $2, $0, 10
syscall

foo:
jal bar
addiu $2, $0, 10
syscall

bar:
addiu $2, $0, 10
syscall

