#!/usr/bin/python

import random

# Terminals
regs = ['$t0', '$t1', '$t2', '$t3', '$t4', '$t5', '$t6', '$t7']
imm = None

# Args
itype_args = (' ', regs, ',', regs, ',', imm)
rtype_args = (' ', regs, ',', regs, ',', regs)

# Insns
itype_ops = ['addiu', 'andi', 'ori', 'xori', 'sltiu']
rtype_ops = ['addu', 'subu', 'and', 'or', 'nor', 'xor']
itype_insns = (itype_ops, itype_args)
rtype_insns = (rtype_ops, rtype_args)

# specials
ldst_insns = [
        ( ['lw', 'lh', 'lhu', 'lb', 'lbu'], ' ', regs, ', 0($a0)' ),
        ( ['sw', 'sh', 'sb'], ' ', regs, ', 0($a0)' )
        ]
muldiv_insns = [
        ( 'mult ', regs, ',', regs, "\n", "add $0, $0, $0\n", "mflo ", regs ),
        ( 'multu ', regs, ',', regs, "\n", "add $0, $0, $0\n", "mflo ", regs ),
        ( 'mult ', regs, ',', regs, "\n", 'mult ', regs, ',', regs, "\n", "add $0, $0, $0\n", "mflo ", regs )
        ]

# All insns
insn = [ itype_insns, rtype_insns, ldst_insns, muldiv_insns ]

# Program
prefix = (".text\nlui $a0, 0x1000\n", "li $t0, 0x12345678\n", "sw $t0, 0($a0)\n",
    "li $t0, 0\nli $t1, 0\nli $t2, 0\nli $t3, 0\nli $t4, 0\nli $t5, 0\nli $t6, 0\nli $t7, 0\n")
suffix = ("addiu $v0, $0, 10\n", "syscall\n")

program = list()
program.append(prefix)
for i in range(1000):
    program.append(insn)
    program.append("\n")
program.append(suffix)

program = tuple(program)

def process_tree(x):
    if type(x) == type( [] ):
        r = int(random.random() * len(x))
        if r >= len(x): r = len(x)
        return process_tree(x[r])
    elif type(x) == type( () ):
        return ' '.join(map(process_tree, x))
    elif x == None:
        return str(random.randint(0, 0xffffffff))
    else:
        return x

print process_tree(program)
