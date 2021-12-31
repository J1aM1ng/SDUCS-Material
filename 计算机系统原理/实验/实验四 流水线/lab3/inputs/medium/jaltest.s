.text
foo:
jal foo2
j foo
foo2:
addiu $v0, $0, 10
syscall
