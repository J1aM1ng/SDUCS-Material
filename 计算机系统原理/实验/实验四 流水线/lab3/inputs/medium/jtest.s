.text
addiu $a1, $0, 42
j foo
addiu $a1, $0, 43
foo:
addiu $v0, $0, 10
syscall
