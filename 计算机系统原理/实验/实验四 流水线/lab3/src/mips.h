#ifndef _MIPS_H_
#define _MIPS_H_

/* special sub-opcodes (opcode=0) */
#define OP_SPECIAL 0x00
#define SUBOP_SLL 0x0
#define SUBOP_SRL 0x2
#define SUBOP_SRA 0x3
#define SUBOP_SLLV 0x4
#define SUBOP_SRLV 0x6
#define SUBOP_SRAV 0x7
#define SUBOP_JR   0x8
#define SUBOP_JALR 0x9
#define SUBOP_SYSCALL 0xc
#define SUBOP_MULT 0x18
#define SUBOP_MULTU 0x19
#define SUBOP_DIV  0x1a
#define SUBOP_DIVU 0x1b
#define SUBOP_ADD  0x20
#define SUBOP_ADDU 0x21
#define SUBOP_SUB  0x22
#define SUBOP_SUBU 0x23
#define SUBOP_AND  0x24
#define SUBOP_OR   0x25
#define SUBOP_XOR  0x26
#define SUBOP_NOR  0x27
#define SUBOP_SLT  0x2A
#define SUBOP_SLTU 0x2B

#define SUBOP_MFHI 0x10
#define SUBOP_MTHI 0x11
#define SUBOP_MFLO 0x12
#define SUBOP_MTLO 0x13

/* special sub-opcodes (opcode=1) */
#define OP_BRSPEC 0x01 /* special branches */
#define BROP_BLTZ 0x00
#define BROP_BGEZ 0x1
#define BROP_BLTZAL 0x10
#define BROP_BGEZAL 0x11

/* primary opcodes */
#define OP_J     0x02
#define OP_JAL   0x03
#define OP_BEQ   0x04
#define OP_BNE   0x05
#define OP_BLEZ  0x06
#define OP_BGTZ  0x07
#define OP_ADDI  0x08
#define OP_ADDIU 0x09
#define OP_SLTI  0x0a
#define OP_SLTIU 0x0b
#define OP_ANDI  0x0c
#define OP_ORI   0x0d
#define OP_XORI  0x0e
#define OP_LUI   0x0f
#define OP_LB    0x20
#define OP_LH    0x21
#define OP_LW    0x23
#define OP_LBU   0x24
#define OP_LHU   0x25
#define OP_SB    0x28
#define OP_SH    0x29
#define OP_SW    0x2b

#endif
