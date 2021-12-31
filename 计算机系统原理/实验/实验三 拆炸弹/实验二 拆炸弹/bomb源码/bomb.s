	.file	1 "bomb.c"
	.section .mdebug.abi32
	.previous
	.gnu_attribute 4, 1
	.abicalls

	.comm	infile,4,4
	.globl	num_input_strings
	.section	.bss,"aw",@nobits
	.align	2
	.type	num_input_strings, @object
	.size	num_input_strings, 4
num_input_strings:
	.space	4

	.comm	input_strings,1600,4

	.comm	ID_num,48,4

	.comm	ID_num_Raw,20,4
	.globl	node6
	.data
	.align	2
	.type	node6, @object
	.size	node6, 12
node6:
	.word	432
	.word	6
	.word	0
	.globl	node5
	.section	.data.rel,"aw",@progbits
	.align	2
	.type	node5, @object
	.size	node5, 12
node5:
	.word	212
	.word	5
	.word	node6
	.globl	node4
	.align	2
	.type	node4, @object
	.size	node4, 12
node4:
	.word	997
	.word	4
	.word	node5
	.globl	node3
	.align	2
	.type	node3, @object
	.size	node3, 12
node3:
	.word	301
	.word	3
	.word	node4
	.globl	node2
	.align	2
	.type	node2, @object
	.size	node2, 12
node2:
	.word	725
	.word	2
	.word	node3
	.globl	node1
	.align	2
	.type	node1, @object
	.size	node1, 12
node1:
	.word	253
	.word	1
	.word	node2
	.globl	n48
	.data
	.align	2
	.type	n48, @object
	.size	n48, 12
n48:
	.word	1001
	.word	0
	.word	0
	.globl	n46
	.align	2
	.type	n46, @object
	.size	n46, 12
n46:
	.word	47
	.word	0
	.word	0
	.globl	n43
	.align	2
	.type	n43, @object
	.size	n43, 12
n43:
	.word	20
	.word	0
	.word	0
	.globl	n42
	.align	2
	.type	n42, @object
	.size	n42, 12
n42:
	.word	7
	.word	0
	.word	0
	.globl	n44
	.align	2
	.type	n44, @object
	.size	n44, 12
n44:
	.word	35
	.word	0
	.word	0
	.globl	n47
	.align	2
	.type	n47, @object
	.size	n47, 12
n47:
	.word	99
	.word	0
	.word	0
	.globl	n41
	.align	2
	.type	n41, @object
	.size	n41, 12
n41:
	.word	1
	.word	0
	.word	0
	.globl	n45
	.align	2
	.type	n45, @object
	.size	n45, 12
n45:
	.word	40
	.word	0
	.word	0
	.globl	n34
	.section	.data.rel
	.align	2
	.type	n34, @object
	.size	n34, 12
n34:
	.word	107
	.word	n47
	.word	n48
	.globl	n31
	.align	2
	.type	n31, @object
	.size	n31, 12
n31:
	.word	6
	.word	n41
	.word	n42
	.globl	n33
	.align	2
	.type	n33, @object
	.size	n33, 12
n33:
	.word	45
	.word	n45
	.word	n46
	.globl	n32
	.align	2
	.type	n32, @object
	.size	n32, 12
n32:
	.word	22
	.word	n43
	.word	n44
	.globl	n22
	.align	2
	.type	n22, @object
	.size	n22, 12
n22:
	.word	50
	.word	n33
	.word	n34
	.globl	n21
	.align	2
	.type	n21, @object
	.size	n21, 12
n21:
	.word	8
	.word	n31
	.word	n32
	.globl	n1
	.align	2
	.type	n1, @object
	.size	n1, 12
n1:
	.word	36
	.word	n21
	.word	n22
	.rdata
	.align	2
$LC0:
	.ascii	"r\000"
	.align	2
$LC1:
	.ascii	"%s: Error: Couldn't open %s\012\000"
	.align	2
$LC2:
	.ascii	"Usage: %s [<input_file>]\012\000"
	.align	2
$LC3:
	.ascii	"Please input your ID_number:\000"
	.align	2
$LC4:
	.ascii	"%s\000"
	.align	2
$LC5:
	.ascii	"Welcome to my fiendish little bomb. You have 6 phases wi"
	.ascii	"th\000"
	.align	2
$LC6:
	.ascii	"which to blow yourself up. Have a nice day!\000"
	.align	2
$LC7:
	.ascii	"Phase 1 defused. How about the next one?\000"
	.align	2
$LC8:
	.ascii	"That's number 2.  Keep going!\000"
	.align	2
$LC9:
	.ascii	"Halfway there!\000"
	.align	2
$LC10:
	.ascii	"So you got that one.  Try this one.\000"
	.align	2
$LC11:
	.ascii	"Good work!  On to the next...\000"
	.text
	.align	2
	.globl	main
	.set	nomips16
	.ent	main
	.type	main, @function
main:
	.frame	$fp,48,$31		# vars= 16, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-48
	sw	$31,44($sp)
	sw	$fp,40($sp)
	move	$fp,$sp
	lui	$28,%hi(__gnu_local_gp)
	addiu	$28,$28,%lo(__gnu_local_gp)
	.cprestore	16
	sw	$4,48($fp)
	sw	$5,52($fp)
	lw	$3,48($fp)
	li	$2,1			# 0x1
	bne	$3,$2,$L2
	nop

	lw	$2,%got(stdin)($28)
	nop
	lw	$3,0($2)
	lw	$2,%got(infile)($28)
	nop
	sw	$3,0($2)
	b	$L3
	nop

$L2:
	lw	$3,48($fp)
	li	$2,2			# 0x2
	bne	$3,$2,$L4
	nop

	lw	$2,52($fp)
	nop
	addiu	$2,$2,4
	lw	$2,0($2)
	nop
	move	$3,$2
	lui	$2,%hi($LC0)
	addiu	$2,$2,%lo($LC0)
	move	$4,$3
	move	$5,$2
	lw	$2,%call16(fopen)($28)
	nop
	move	$25,$2
	jalr	$25
	nop

	lw	$28,16($fp)
	move	$3,$2
	lw	$2,%got(infile)($28)
	nop
	sw	$3,0($2)
	lw	$2,%got(infile)($28)
	nop
	lw	$2,0($2)
	nop
	bne	$2,$0,$L3
	nop

	lui	$2,%hi($LC1)
	addiu	$4,$2,%lo($LC1)
	lw	$2,52($fp)
	nop
	lw	$3,0($2)
	lw	$2,52($fp)
	nop
	addiu	$2,$2,4
	lw	$2,0($2)
	move	$5,$3
	move	$6,$2
	lw	$2,%call16(printf)($28)
	nop
	move	$25,$2
	jalr	$25
	nop

	lw	$28,16($fp)
	li	$4,8			# 0x8
	lw	$2,%call16(exit)($28)
	nop
	move	$25,$2
	jalr	$25
	nop

$L4:
	lui	$2,%hi($LC2)
	addiu	$3,$2,%lo($LC2)
	lw	$2,52($fp)
	nop
	lw	$2,0($2)
	move	$4,$3
	move	$5,$2
	lw	$2,%call16(printf)($28)
	nop
	move	$25,$2
	jalr	$25
	nop

	lw	$28,16($fp)
	li	$4,8			# 0x8
	lw	$2,%call16(exit)($28)
	nop
	move	$25,$2
	jalr	$25
	nop

$L3:
	.option	pic0
	jal	initialize_bomb
	nop

	.option	pic2
	lw	$28,16($fp)
	lui	$2,%hi($LC3)
	addiu	$4,$2,%lo($LC3)
	lw	$2,%call16(puts)($28)
	nop
	move	$25,$2
	jalr	$25
	nop

	lw	$28,16($fp)
	lui	$2,%hi($LC4)
	addiu	$2,$2,%lo($LC4)
	move	$4,$2
	lw	$5,%got(ID_num_Raw)($28)
	lw	$2,%call16(__isoc99_scanf)($28)
	nop
	move	$25,$2
	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$0,28($fp)
	lw	$4,%got(ID_num_Raw)($28)
	lw	$2,%call16(strlen)($28)
	nop
	move	$25,$2
	jalr	$25
	nop

	lw	$28,16($fp)
	addiu	$2,$2,-1
	sw	$2,24($fp)
	b	$L5
	nop

$L6:
	li	$3,11			# 0xb
	lw	$2,28($fp)
	nop
	subu	$2,$3,$2
	lw	$3,24($fp)
	lw	$4,%got(ID_num_Raw)($28)
	nop
	addu	$3,$4,$3
	lb	$3,0($3)
	nop
	addiu	$3,$3,-48
	lw	$4,%got(ID_num)($28)
	sll	$2,$2,2
	addu	$2,$4,$2
	sw	$3,0($2)
	lw	$2,28($fp)
	nop
	addiu	$2,$2,1
	sw	$2,28($fp)
	lw	$2,24($fp)
	nop
	addiu	$2,$2,-1
	sw	$2,24($fp)
$L5:
	lw	$2,28($fp)
	nop
	slt	$2,$2,12
	bne	$2,$0,$L6
	nop

	lui	$2,%hi($LC5)
	addiu	$4,$2,%lo($LC5)
	lw	$2,%call16(puts)($28)
	nop
	move	$25,$2
	jalr	$25
	nop

	lw	$28,16($fp)
	lui	$2,%hi($LC6)
	addiu	$4,$2,%lo($LC6)
	lw	$2,%call16(puts)($28)
	nop
	move	$25,$2
	jalr	$25
	nop

	lw	$28,16($fp)
	.option	pic0
	jal	read_line
	nop

	.option	pic2
	lw	$28,16($fp)
	sw	$2,32($fp)
	lw	$4,32($fp)
	.option	pic0
	jal	phase_1
	nop

	.option	pic2
	lw	$28,16($fp)
	.option	pic0
	jal	phase_defused
	nop

	.option	pic2
	lw	$28,16($fp)
	lui	$2,%hi($LC7)
	addiu	$4,$2,%lo($LC7)
	lw	$2,%call16(puts)($28)
	nop
	move	$25,$2
	jalr	$25
	nop

	lw	$28,16($fp)
	.option	pic0
	jal	read_line
	nop

	.option	pic2
	lw	$28,16($fp)
	sw	$2,32($fp)
	lw	$4,32($fp)
	.option	pic0
	jal	phase_2
	nop

	.option	pic2
	lw	$28,16($fp)
	.option	pic0
	jal	phase_defused
	nop

	.option	pic2
	lw	$28,16($fp)
	lui	$2,%hi($LC8)
	addiu	$4,$2,%lo($LC8)
	lw	$2,%call16(puts)($28)
	nop
	move	$25,$2
	jalr	$25
	nop

	lw	$28,16($fp)
	.option	pic0
	jal	read_line
	nop

	.option	pic2
	lw	$28,16($fp)
	sw	$2,32($fp)
	lw	$4,32($fp)
	.option	pic0
	jal	phase_3
	nop

	.option	pic2
	lw	$28,16($fp)
	.option	pic0
	jal	phase_defused
	nop

	.option	pic2
	lw	$28,16($fp)
	lui	$2,%hi($LC9)
	addiu	$4,$2,%lo($LC9)
	lw	$2,%call16(puts)($28)
	nop
	move	$25,$2
	jalr	$25
	nop

	lw	$28,16($fp)
	.option	pic0
	jal	read_line
	nop

	.option	pic2
	lw	$28,16($fp)
	sw	$2,32($fp)
	lw	$4,32($fp)
	.option	pic0
	jal	phase_4
	nop

	.option	pic2
	lw	$28,16($fp)
	.option	pic0
	jal	phase_defused
	nop

	.option	pic2
	lw	$28,16($fp)
	lui	$2,%hi($LC10)
	addiu	$4,$2,%lo($LC10)
	lw	$2,%call16(puts)($28)
	nop
	move	$25,$2
	jalr	$25
	nop

	lw	$28,16($fp)
	.option	pic0
	jal	read_line
	nop

	.option	pic2
	lw	$28,16($fp)
	sw	$2,32($fp)
	lw	$4,32($fp)
	.option	pic0
	jal	phase_5
	nop

	.option	pic2
	lw	$28,16($fp)
	.option	pic0
	jal	phase_defused
	nop

	.option	pic2
	lw	$28,16($fp)
	lui	$2,%hi($LC11)
	addiu	$4,$2,%lo($LC11)
	lw	$2,%call16(puts)($28)
	nop
	move	$25,$2
	jalr	$25
	nop

	lw	$28,16($fp)
	.option	pic0
	jal	read_line
	nop

	.option	pic2
	lw	$28,16($fp)
	sw	$2,32($fp)
	lw	$4,32($fp)
	.option	pic0
	jal	phase_6
	nop

	.option	pic2
	lw	$28,16($fp)
	.option	pic0
	jal	phase_defused
	nop

	.option	pic2
	lw	$28,16($fp)
	move	$2,$0
	move	$sp,$fp
	lw	$31,44($sp)
	lw	$fp,40($sp)
	addiu	$sp,$sp,48
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.rdata
	.align	2
$LC12:
	.ascii	"Let's begin now!\000"
	.text
	.align	2
	.globl	phase_1
	.set	nomips16
	.ent	phase_1
	.type	phase_1, @function
phase_1:
	.frame	$fp,32,$31		# vars= 0, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$fp,24($sp)
	move	$fp,$sp
	sw	$4,32($fp)
	lw	$4,32($fp)
	lui	$2,%hi($LC12)
	addiu	$5,$2,%lo($LC12)
	.option	pic0
	jal	strings_not_equal
	nop

	.option	pic2
	beq	$2,$0,$L10
	nop

	.option	pic0
	jal	explode_bomb
	nop

	.option	pic2
$L10:
	move	$sp,$fp
	lw	$31,28($sp)
	lw	$fp,24($sp)
	addiu	$sp,$sp,32
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	phase_1
	.size	phase_1, .-phase_1
	.align	2
	.globl	phase_2
	.set	nomips16
	.ent	phase_2
	.type	phase_2, @function
phase_2:
	.frame	$fp,64,$31		# vars= 32, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-64
	sw	$31,60($sp)
	sw	$fp,56($sp)
	move	$fp,$sp
	lui	$28,%hi(__gnu_local_gp)
	addiu	$28,$28,%lo(__gnu_local_gp)
	.cprestore	16
	sw	$4,64($fp)
	addiu	$2,$fp,28
	lw	$4,64($fp)
	move	$5,$2
	.option	pic0
	jal	read_six_numbers
	nop

	.option	pic2
	lw	$28,16($fp)
	lw	$3,28($fp)
	li	$2,1			# 0x1
	beq	$3,$2,$L12
	nop

	.option	pic0
	jal	explode_bomb
	nop

	.option	pic2
	lw	$28,16($fp)
$L12:
	li	$2,1			# 0x1
	sw	$2,24($fp)
	b	$L13
	nop

$L15:
	lw	$2,24($fp)
	nop
	addiu	$2,$2,-1
	sll	$2,$2,2
	addiu	$3,$fp,24
	addu	$2,$3,$2
	lw	$4,4($2)
	li	$3,12			# 0xc
	lw	$2,24($fp)
	nop
	subu	$2,$3,$2
	lw	$3,%got(ID_num)($28)
	sll	$2,$2,2
	addu	$2,$3,$2
	lw	$2,0($2)
	nop
	mult	$4,$2
	mflo	$4
	lw	$2,24($fp)
	nop
	sll	$2,$2,2
	addiu	$3,$fp,24
	addu	$2,$3,$2
	lw	$2,4($2)
	nop
	beq	$4,$2,$L14
	nop

	.option	pic0
	jal	explode_bomb
	nop

	.option	pic2
	lw	$28,16($fp)
$L14:
	lw	$2,24($fp)
	nop
	addiu	$2,$2,1
	sw	$2,24($fp)
$L13:
	lw	$2,24($fp)
	nop
	slt	$2,$2,6
	bne	$2,$0,$L15
	nop

	move	$sp,$fp
	lw	$31,60($sp)
	lw	$fp,56($sp)
	addiu	$sp,$sp,64
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	phase_2
	.size	phase_2, .-phase_2
	.rdata
	.align	2
$LC13:
	.ascii	"%d %c %d\000"
	.text
	.align	2
	.globl	phase_3
	.set	nomips16
	.ent	phase_3
	.type	phase_3, @function
phase_3:
	.frame	$fp,56,$31		# vars= 16, regs= 2/0, args= 24, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-56
	sw	$31,52($sp)
	sw	$fp,48($sp)
	move	$fp,$sp
	lui	$28,%hi(__gnu_local_gp)
	addiu	$28,$28,%lo(__gnu_local_gp)
	.cprestore	24
	sw	$4,56($fp)
	lw	$4,56($fp)
	lui	$2,%hi($LC13)
	addiu	$5,$2,%lo($LC13)
	addiu	$3,$fp,44
	addiu	$2,$fp,40
	addiu	$6,$fp,36
	sw	$6,16($sp)
	move	$6,$3
	move	$7,$2
	lw	$2,%call16(__isoc99_sscanf)($28)
	nop
	move	$25,$2
	jalr	$25
	nop

	lw	$28,24($fp)
	slt	$2,$2,3
	beq	$2,$0,$L18
	nop

	.option	pic0
	jal	explode_bomb
	nop

	.option	pic2
	lw	$28,24($fp)
$L18:
	lw	$2,44($fp)
	nop
	sltu	$3,$2,8
	beq	$3,$0,$L19
	nop

	sll	$3,$2,2
	lui	$2,%hi($L28)
	addiu	$2,$2,%lo($L28)
	addu	$2,$3,$2
	lw	$2,0($2)
	nop
	j	$2
	nop

	.rdata
	.align	2
	.align	2
$L28:
	.word	$L20
	.word	$L21
	.word	$L22
	.word	$L23
	.word	$L24
	.word	$L25
	.word	$L26
	.word	$L27
	.text
$L20:
	li	$2,113			# 0x71
	sb	$2,32($fp)
	lw	$2,%got(ID_num)($28)
	nop
	lw	$3,44($2)
	lw	$2,36($fp)
	nop
	mult	$3,$2
	mflo	$3
	li	$2,777			# 0x309
	beq	$3,$2,$L39
	nop

	.option	pic0
	jal	explode_bomb
	nop

	.option	pic2
	lw	$28,24($fp)
	b	$L30
	nop

$L21:
	li	$2,98			# 0x62
	sb	$2,32($fp)
	lw	$2,%got(ID_num)($28)
	nop
	lw	$3,44($2)
	lw	$2,36($fp)
	nop
	mult	$3,$2
	mflo	$3
	li	$2,214			# 0xd6
	beq	$3,$2,$L40
	nop

	.option	pic0
	jal	explode_bomb
	nop

	.option	pic2
	lw	$28,24($fp)
	b	$L30
	nop

$L22:
	li	$2,98			# 0x62
	sb	$2,32($fp)
	lw	$2,%got(ID_num)($28)
	nop
	lw	$3,44($2)
	lw	$2,36($fp)
	nop
	mult	$3,$2
	mflo	$3
	li	$2,755			# 0x2f3
	beq	$3,$2,$L41
	nop

	.option	pic0
	jal	explode_bomb
	nop

	.option	pic2
	lw	$28,24($fp)
	b	$L30
	nop

$L23:
	li	$2,107			# 0x6b
	sb	$2,32($fp)
	lw	$2,%got(ID_num)($28)
	nop
	lw	$3,44($2)
	lw	$2,36($fp)
	nop
	mult	$3,$2
	mflo	$2
	beq	$2,$0,$L42
	nop

	.option	pic0
	jal	explode_bomb
	nop

	.option	pic2
	lw	$28,24($fp)
	b	$L30
	nop

$L24:
	li	$2,111			# 0x6f
	sb	$2,32($fp)
	lw	$2,%got(ID_num)($28)
	nop
	lw	$3,44($2)
	lw	$2,36($fp)
	nop
	mult	$3,$2
	mflo	$3
	li	$2,228			# 0xe4
	beq	$3,$2,$L43
	nop

	.option	pic0
	jal	explode_bomb
	nop

	.option	pic2
	lw	$28,24($fp)
	b	$L30
	nop

$L25:
	li	$2,116			# 0x74
	sb	$2,32($fp)
	lw	$2,%got(ID_num)($28)
	nop
	lw	$3,44($2)
	lw	$2,36($fp)
	nop
	mult	$3,$2
	mflo	$3
	li	$2,513			# 0x201
	beq	$3,$2,$L44
	nop

	.option	pic0
	jal	explode_bomb
	nop

	.option	pic2
	lw	$28,24($fp)
	b	$L30
	nop

$L26:
	li	$2,118			# 0x76
	sb	$2,32($fp)
	lw	$2,%got(ID_num)($28)
	nop
	lw	$3,44($2)
	lw	$2,36($fp)
	nop
	mult	$3,$2
	mflo	$3
	li	$2,780			# 0x30c
	beq	$3,$2,$L27
	nop

	.option	pic0
	jal	explode_bomb
	nop

	.option	pic2
	lw	$28,24($fp)
$L27:
	li	$2,98			# 0x62
	sb	$2,32($fp)
	lw	$2,%got(ID_num)($28)
	nop
	lw	$3,44($2)
	lw	$2,36($fp)
	nop
	mult	$3,$2
	mflo	$3
	li	$2,824			# 0x338
	beq	$3,$2,$L45
	nop

	.option	pic0
	jal	explode_bomb
	nop

	.option	pic2
	lw	$28,24($fp)
	b	$L30
	nop

$L19:
	li	$2,120			# 0x78
	sb	$2,32($fp)
	.option	pic0
	jal	explode_bomb
	nop

	.option	pic2
	lw	$28,24($fp)
	b	$L30
	nop

$L39:
	nop
	b	$L30
	nop

$L40:
	nop
	b	$L30
	nop

$L41:
	nop
	b	$L30
	nop

$L42:
	nop
	b	$L30
	nop

$L43:
	nop
	b	$L30
	nop

$L44:
	nop
	b	$L30
	nop

$L45:
	nop
$L30:
	lb	$2,40($fp)
	lb	$3,32($fp)
	nop
	beq	$3,$2,$L38
	nop

	.option	pic0
	jal	explode_bomb
	nop

	.option	pic2
	lw	$28,24($fp)
$L38:
	move	$sp,$fp
	lw	$31,52($sp)
	lw	$fp,48($sp)
	addiu	$sp,$sp,56
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	phase_3
	.size	phase_3, .-phase_3
	.align	2
	.globl	func4
	.set	nomips16
	.ent	func4
	.type	func4, @function
func4:
	.frame	$fp,40,$31		# vars= 0, regs= 3/0, args= 16, gp= 8
	.mask	0xc0010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-40
	sw	$31,36($sp)
	sw	$fp,32($sp)
	sw	$16,28($sp)
	move	$fp,$sp
	sw	$4,40($fp)
	lw	$2,40($fp)
	nop
	slt	$2,$2,2
	bne	$2,$0,$L47
	nop

	lw	$2,40($fp)
	nop
	addiu	$2,$2,-1
	move	$4,$2
	.option	pic0
	jal	func4
	nop

	.option	pic2
	move	$16,$2
	lw	$2,40($fp)
	nop
	addiu	$2,$2,-2
	move	$4,$2
	.option	pic0
	jal	func4
	nop

	.option	pic2
	addu	$2,$16,$2
	b	$L48
	nop

$L47:
	li	$2,1			# 0x1
$L48:
	move	$sp,$fp
	lw	$31,36($sp)
	lw	$fp,32($sp)
	lw	$16,28($sp)
	addiu	$sp,$sp,40
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	func4
	.size	func4, .-func4
	.rdata
	.align	2
$LC14:
	.ascii	"%d\000"
	.text
	.align	2
	.globl	phase_4
	.set	nomips16
	.ent	phase_4
	.type	phase_4, @function
phase_4:
	.frame	$fp,40,$31		# vars= 8, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-40
	sw	$31,36($sp)
	sw	$fp,32($sp)
	move	$fp,$sp
	lui	$28,%hi(__gnu_local_gp)
	addiu	$28,$28,%lo(__gnu_local_gp)
	.cprestore	16
	sw	$4,40($fp)
	lw	$3,40($fp)
	lui	$2,%hi($LC14)
	addiu	$2,$2,%lo($LC14)
	move	$4,$3
	move	$5,$2
	addiu	$2,$fp,24
	move	$6,$2
	lw	$2,%call16(__isoc99_sscanf)($28)
	nop
	move	$25,$2
	jalr	$25
	nop

	lw	$28,16($fp)
	move	$3,$2
	li	$2,1			# 0x1
	bne	$3,$2,$L51
	nop

	lw	$2,24($fp)
	nop
	bgtz	$2,$L52
	nop

$L51:
	.option	pic0
	jal	explode_bomb
	nop

	.option	pic2
	lw	$28,16($fp)
	nop
$L52:
	lw	$2,%got(ID_num)($28)
	nop
	lw	$2,44($2)
	nop
	andi	$2,$2,0x1
	andi	$2,$2,0x00ff
	beq	$2,$0,$L53
	nop

	lw	$2,24($fp)
	nop
	move	$4,$2
	.option	pic0
	jal	func4
	nop

	.option	pic2
	lw	$28,16($fp)
	move	$3,$2
	li	$2,8			# 0x8
	beq	$3,$2,$L55
	nop

	.option	pic0
	jal	explode_bomb
	nop

	.option	pic2
	lw	$28,16($fp)
	b	$L55
	nop

$L53:
	lw	$2,24($fp)
	nop
	move	$4,$2
	.option	pic0
	jal	func4
	nop

	.option	pic2
	lw	$28,16($fp)
	move	$3,$2
	li	$2,13			# 0xd
	beq	$3,$2,$L55
	nop

	.option	pic0
	jal	explode_bomb
	nop

	.option	pic2
	lw	$28,16($fp)
$L55:
	move	$sp,$fp
	lw	$31,36($sp)
	lw	$fp,32($sp)
	addiu	$sp,$sp,40
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	phase_4
	.size	phase_4, .-phase_4
	.rdata
	.align	2
$LC15:
	.ascii	"giants\000"
	.text
	.align	2
	.globl	phase_5
	.set	nomips16
	.ent	phase_5
	.type	phase_5, @function
phase_5:
	.frame	$fp,72,$31		# vars= 40, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-72
	sw	$31,68($sp)
	sw	$fp,64($sp)
	move	$fp,$sp
	sw	$4,72($fp)
	lw	$4,72($fp)
	.option	pic0
	jal	string_length
	nop

	.option	pic2
	move	$3,$2
	li	$2,6			# 0x6
	beq	$3,$2,$L57
	nop

	.option	pic0
	jal	explode_bomb
	nop

	.option	pic2
$L57:
	sw	$0,24($fp)
	b	$L58
	nop

$L59:
	lw	$2,24($fp)
	lw	$3,24($fp)
	lw	$4,72($fp)
	nop
	addu	$3,$4,$3
	lb	$3,0($3)
	nop
	andi	$3,$3,0x00ff
	andi	$3,$3,0xf
	sll	$2,$2,2
	addiu	$4,$fp,24
	addu	$2,$4,$2
	sw	$3,12($2)
	lw	$4,24($fp)
	lw	$2,24($fp)
	nop
	sll	$2,$2,2
	addiu	$3,$fp,24
	addu	$2,$3,$2
	lw	$3,12($2)
	lui	$2,%hi(array.3607)
	addiu	$2,$2,%lo(array.3607)
	addu	$2,$3,$2
	lb	$3,0($2)
	addiu	$2,$fp,24
	addu	$2,$2,$4
	sb	$3,4($2)
	lw	$2,24($fp)
	nop
	addiu	$2,$2,1
	sw	$2,24($fp)
$L58:
	lw	$2,24($fp)
	nop
	slt	$2,$2,6
	bne	$2,$0,$L59
	nop

	sb	$0,34($fp)
	addiu	$2,$fp,28
	move	$4,$2
	lui	$2,%hi($LC15)
	addiu	$5,$2,%lo($LC15)
	.option	pic0
	jal	strings_not_equal
	nop

	.option	pic2
	beq	$2,$0,$L61
	nop

	.option	pic0
	jal	explode_bomb
	nop

	.option	pic2
$L61:
	move	$sp,$fp
	lw	$31,68($sp)
	lw	$fp,64($sp)
	addiu	$sp,$sp,72
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	phase_5
	.size	phase_5, .-phase_5
	.align	2
	.globl	phase_6
	.set	nomips16
	.ent	phase_6
	.type	phase_6, @function
phase_6:
	.frame	$fp,96,$31		# vars= 64, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-96
	sw	$31,92($sp)
	sw	$fp,88($sp)
	move	$fp,$sp
	lui	$28,%hi(__gnu_local_gp)
	addiu	$28,$28,%lo(__gnu_local_gp)
	.cprestore	16
	sw	$4,96($fp)
	lui	$2,%hi(node1)
	addiu	$2,$2,%lo(node1)
	sw	$2,32($fp)
	addiu	$2,$fp,36
	lw	$4,96($fp)
	move	$5,$2
	.option	pic0
	jal	read_six_numbers
	nop

	.option	pic2
	lw	$28,16($fp)
	sw	$0,28($fp)
	b	$L63
	nop

$L69:
	lw	$2,28($fp)
	nop
	sll	$2,$2,2
	addiu	$3,$fp,24
	addu	$2,$3,$2
	lw	$2,12($2)
	nop
	slt	$2,$2,7
	beq	$2,$0,$L64
	nop

	lw	$2,28($fp)
	nop
	sll	$2,$2,2
	addiu	$3,$fp,24
	addu	$2,$3,$2
	lw	$2,12($2)
	nop
	bgtz	$2,$L65
	nop

$L64:
	.option	pic0
	jal	explode_bomb
	nop

	.option	pic2
	lw	$28,16($fp)
$L65:
	lw	$2,28($fp)
	nop
	addiu	$2,$2,1
	sw	$2,24($fp)
	b	$L66
	nop

$L68:
	lw	$2,28($fp)
	nop
	sll	$2,$2,2
	addiu	$3,$fp,24
	addu	$2,$3,$2
	lw	$3,12($2)
	lw	$2,24($fp)
	nop
	sll	$2,$2,2
	addiu	$4,$fp,24
	addu	$2,$4,$2
	lw	$2,12($2)
	nop
	bne	$3,$2,$L67
	nop

	.option	pic0
	jal	explode_bomb
	nop

	.option	pic2
	lw	$28,16($fp)
$L67:
	lw	$2,24($fp)
	nop
	addiu	$2,$2,1
	sw	$2,24($fp)
$L66:
	lw	$2,24($fp)
	nop
	slt	$2,$2,6
	bne	$2,$0,$L68
	nop

	lw	$2,28($fp)
	nop
	addiu	$2,$2,1
	sw	$2,28($fp)
$L63:
	lw	$2,28($fp)
	nop
	slt	$2,$2,6
	bne	$2,$0,$L69
	nop

	sw	$0,28($fp)
	b	$L70
	nop

$L73:
	lui	$2,%hi(node1)
	addiu	$2,$2,%lo(node1)
	sw	$2,32($fp)
	li	$2,1			# 0x1
	sw	$2,24($fp)
	b	$L71
	nop

$L72:
	lw	$2,32($fp)
	nop
	lw	$2,8($2)
	nop
	sw	$2,32($fp)
	lw	$2,24($fp)
	nop
	addiu	$2,$2,1
	sw	$2,24($fp)
$L71:
	lw	$2,28($fp)
	nop
	sll	$2,$2,2
	addiu	$3,$fp,24
	addu	$2,$3,$2
	lw	$3,12($2)
	lw	$2,24($fp)
	nop
	slt	$2,$2,$3
	bne	$2,$0,$L72
	nop

	lw	$2,28($fp)
	nop
	sll	$2,$2,2
	addiu	$3,$fp,24
	addu	$2,$3,$2
	lw	$3,32($fp)
	nop
	sw	$3,36($2)
	lw	$2,28($fp)
	nop
	addiu	$2,$2,1
	sw	$2,28($fp)
$L70:
	lw	$2,28($fp)
	nop
	slt	$2,$2,6
	bne	$2,$0,$L73
	nop

	lw	$2,60($fp)
	nop
	sw	$2,32($fp)
	li	$2,1			# 0x1
	sw	$2,28($fp)
	b	$L74
	nop

$L75:
	lw	$2,28($fp)
	nop
	sll	$2,$2,2
	addiu	$3,$fp,24
	addu	$2,$3,$2
	lw	$3,36($2)
	lw	$2,32($fp)
	nop
	sw	$3,8($2)
	lw	$2,28($fp)
	nop
	sll	$2,$2,2
	addiu	$3,$fp,24
	addu	$2,$3,$2
	lw	$2,36($2)
	nop
	sw	$2,32($fp)
	lw	$2,28($fp)
	nop
	addiu	$2,$2,1
	sw	$2,28($fp)
$L74:
	lw	$2,28($fp)
	nop
	slt	$2,$2,6
	bne	$2,$0,$L75
	nop

	lw	$2,32($fp)
	nop
	sw	$0,8($2)
	lw	$2,60($fp)
	nop
	sw	$2,32($fp)
	sw	$0,28($fp)
	b	$L76
	nop

$L79:
	lw	$2,%got(ID_num)($28)
	nop
	lw	$2,44($2)
	nop
	andi	$2,$2,0x1
	andi	$2,$2,0x00ff
	beq	$2,$0,$L77
	nop

	lw	$2,32($fp)
	nop
	lw	$3,0($2)
	lw	$2,32($fp)
	nop
	lw	$2,8($2)
	nop
	lw	$2,0($2)
	nop
	slt	$2,$3,$2
	beq	$2,$0,$L78
	nop

	.option	pic0
	jal	explode_bomb
	nop

	.option	pic2
	lw	$28,16($fp)
	b	$L78
	nop

$L77:
	lw	$2,32($fp)
	nop
	lw	$3,0($2)
	lw	$2,32($fp)
	nop
	lw	$2,8($2)
	nop
	lw	$2,0($2)
	nop
	slt	$2,$2,$3
	beq	$2,$0,$L78
	nop

	.option	pic0
	jal	explode_bomb
	nop

	.option	pic2
	lw	$28,16($fp)
$L78:
	lw	$2,32($fp)
	nop
	lw	$2,8($2)
	nop
	sw	$2,32($fp)
	lw	$2,28($fp)
	nop
	addiu	$2,$2,1
	sw	$2,28($fp)
$L76:
	lw	$2,28($fp)
	nop
	slt	$2,$2,5
	bne	$2,$0,$L79
	nop

	move	$sp,$fp
	lw	$31,92($sp)
	lw	$fp,88($sp)
	addiu	$sp,$sp,96
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	phase_6
	.size	phase_6, .-phase_6
	.align	2
	.globl	fun7
	.set	nomips16
	.ent	fun7
	.type	fun7, @function
fun7:
	.frame	$fp,32,$31		# vars= 0, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$fp,24($sp)
	move	$fp,$sp
	sw	$4,32($fp)
	sw	$5,36($fp)
	lw	$2,32($fp)
	nop
	bne	$2,$0,$L82
	nop

	li	$2,-1			# 0xffffffffffffffff
	b	$L83
	nop

$L82:
	lw	$2,32($fp)
	nop
	lw	$3,0($2)
	lw	$2,36($fp)
	nop
	slt	$2,$2,$3
	beq	$2,$0,$L84
	nop

	lw	$2,32($fp)
	nop
	lw	$2,4($2)
	nop
	move	$4,$2
	lw	$5,36($fp)
	.option	pic0
	jal	fun7
	nop

	.option	pic2
	sll	$2,$2,1
	b	$L83
	nop

$L84:
	lw	$2,32($fp)
	nop
	lw	$3,0($2)
	lw	$2,36($fp)
	nop
	slt	$2,$3,$2
	beq	$2,$0,$L85
	nop

	lw	$2,32($fp)
	nop
	lw	$2,8($2)
	nop
	move	$4,$2
	lw	$5,36($fp)
	.option	pic0
	jal	fun7
	nop

	.option	pic2
	sll	$2,$2,1
	addiu	$2,$2,1
	b	$L83
	nop

$L85:
	move	$2,$0
$L83:
	move	$sp,$fp
	lw	$31,28($sp)
	lw	$fp,24($sp)
	addiu	$sp,$sp,32
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	fun7
	.size	fun7, .-fun7
	.rdata
	.align	2
$LC16:
	.ascii	"Wow! You've defused the secret stage!\000"
	.text
	.align	2
	.globl	secret_phase
	.set	nomips16
	.ent	secret_phase
	.type	secret_phase, @function
secret_phase:
	.frame	$fp,40,$31		# vars= 8, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-40
	sw	$31,36($sp)
	sw	$fp,32($sp)
	move	$fp,$sp
	lui	$28,%hi(__gnu_local_gp)
	addiu	$28,$28,%lo(__gnu_local_gp)
	.cprestore	16
	.option	pic0
	jal	read_line
	nop

	.option	pic2
	lw	$28,16($fp)
	sw	$2,28($fp)
	lw	$2,28($fp)
	nop
	move	$4,$2
	move	$5,$0
	li	$6,10			# 0xa
	lw	$2,%call16(strtol)($28)
	nop
	move	$25,$2
	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,24($fp)
	lw	$2,24($fp)
	nop
	addiu	$2,$2,-1
	sltu	$2,$2,1001
	bne	$2,$0,$L88
	nop

	.option	pic0
	jal	explode_bomb
	nop

	.option	pic2
	lw	$28,16($fp)
$L88:
	lui	$2,%hi(n1)
	addiu	$4,$2,%lo(n1)
	lw	$5,24($fp)
	.option	pic0
	jal	fun7
	nop

	.option	pic2
	lw	$28,16($fp)
	move	$3,$2
	li	$2,7			# 0x7
	beq	$3,$2,$L89
	nop

	.option	pic0
	jal	explode_bomb
	nop

	.option	pic2
	lw	$28,16($fp)
$L89:
	lui	$2,%hi($LC16)
	addiu	$4,$2,%lo($LC16)
	lw	$2,%call16(puts)($28)
	nop
	move	$25,$2
	jalr	$25
	nop

	lw	$28,16($fp)
	.option	pic0
	jal	phase_defused
	nop

	.option	pic2
	lw	$28,16($fp)
	move	$sp,$fp
	lw	$31,36($sp)
	lw	$fp,32($sp)
	addiu	$sp,$sp,40
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	secret_phase
	.size	secret_phase, .-secret_phase
	.rdata
	.align	2
$LC17:
	.ascii	"So you think you can stop the bomb with ctrl-c, do you?\000"
	.align	2
$LC18:
	.ascii	"Well...\000"
	.align	2
$LC19:
	.ascii	"OK. :-)\000"
	.text
	.align	2
	.globl	sig_handler
	.set	nomips16
	.ent	sig_handler
	.type	sig_handler, @function
sig_handler:
	.frame	$fp,32,$31		# vars= 0, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$fp,24($sp)
	move	$fp,$sp
	lui	$28,%hi(__gnu_local_gp)
	addiu	$28,$28,%lo(__gnu_local_gp)
	.cprestore	16
	lui	$2,%hi($LC17)
	addiu	$4,$2,%lo($LC17)
	lw	$2,%call16(puts)($28)
	nop
	move	$25,$2
	jalr	$25
	nop

	lw	$28,16($fp)
	li	$4,3			# 0x3
	lw	$2,%call16(sleep)($28)
	nop
	move	$25,$2
	jalr	$25
	nop

	lw	$28,16($fp)
	lui	$2,%hi($LC18)
	addiu	$2,$2,%lo($LC18)
	move	$4,$2
	lw	$2,%call16(printf)($28)
	nop
	move	$25,$2
	jalr	$25
	nop

	lw	$28,16($fp)
	nop
	lw	$2,%got(stdout)($28)
	nop
	lw	$2,0($2)
	nop
	move	$4,$2
	lw	$2,%call16(fflush)($28)
	nop
	move	$25,$2
	jalr	$25
	nop

	lw	$28,16($fp)
	li	$4,1			# 0x1
	lw	$2,%call16(sleep)($28)
	nop
	move	$25,$2
	jalr	$25
	nop

	lw	$28,16($fp)
	lui	$2,%hi($LC19)
	addiu	$4,$2,%lo($LC19)
	lw	$2,%call16(puts)($28)
	nop
	move	$25,$2
	jalr	$25
	nop

	lw	$28,16($fp)
	li	$4,16			# 0x10
	lw	$2,%call16(exit)($28)
	nop
	move	$25,$2
	jalr	$25
	nop

	.set	macro
	.set	reorder
	.end	sig_handler
	.size	sig_handler, .-sig_handler
	.align	2
	.globl	invalid_phase
	.set	nomips16
	.ent	invalid_phase
	.type	invalid_phase, @function
invalid_phase:
	.frame	$fp,8,$31		# vars= 0, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-8
	sw	$fp,4($sp)
	move	$fp,$sp
	move	$sp,$fp
	lw	$fp,4($sp)
	addiu	$sp,$sp,8
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	invalid_phase
	.size	invalid_phase, .-invalid_phase
	.rdata
	.align	2
$LC20:
	.ascii	"%d %d %d %d %d %d\000"
	.text
	.align	2
	.globl	read_six_numbers
	.set	nomips16
	.ent	read_six_numbers
	.type	read_six_numbers, @function
read_six_numbers:
	.frame	$fp,48,$31		# vars= 0, regs= 2/0, args= 32, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-48
	sw	$31,44($sp)
	sw	$fp,40($sp)
	move	$fp,$sp
	lui	$28,%hi(__gnu_local_gp)
	addiu	$28,$28,%lo(__gnu_local_gp)
	.cprestore	32
	sw	$4,48($fp)
	sw	$5,52($fp)
	lw	$4,48($fp)
	lui	$2,%hi($LC20)
	addiu	$3,$2,%lo($LC20)
	lw	$2,52($fp)
	nop
	addiu	$2,$2,4
	lw	$5,52($fp)
	nop
	addiu	$8,$5,8
	lw	$5,52($fp)
	nop
	addiu	$7,$5,12
	lw	$5,52($fp)
	nop
	addiu	$6,$5,16
	lw	$5,52($fp)
	nop
	addiu	$5,$5,20
	sw	$8,16($sp)
	sw	$7,20($sp)
	sw	$6,24($sp)
	sw	$5,28($sp)
	move	$5,$3
	lw	$6,52($fp)
	move	$7,$2
	lw	$2,%call16(__isoc99_sscanf)($28)
	nop
	move	$25,$2
	jalr	$25
	nop

	lw	$28,32($fp)
	slt	$2,$2,6
	beq	$2,$0,$L97
	nop

	.option	pic0
	jal	explode_bomb
	nop

	.option	pic2
	lw	$28,32($fp)
$L97:
	move	$sp,$fp
	lw	$31,44($sp)
	lw	$fp,40($sp)
	addiu	$sp,$sp,48
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	read_six_numbers
	.size	read_six_numbers, .-read_six_numbers
	.align	2
	.globl	string_length
	.set	nomips16
	.ent	string_length
	.type	string_length, @function
string_length:
	.frame	$fp,24,$31		# vars= 8, regs= 1/0, args= 0, gp= 8
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-24
	sw	$fp,20($sp)
	move	$fp,$sp
	sw	$4,24($fp)
	lw	$2,24($fp)
	nop
	sw	$2,12($fp)
	sw	$0,8($fp)
	b	$L99
	nop

$L100:
	lw	$2,8($fp)
	nop
	addiu	$2,$2,1
	sw	$2,8($fp)
$L99:
	lw	$2,12($fp)
	nop
	lb	$2,0($2)
	nop
	sltu	$2,$0,$2
	andi	$2,$2,0x00ff
	lw	$3,12($fp)
	nop
	addiu	$3,$3,1
	sw	$3,12($fp)
	bne	$2,$0,$L100
	nop

	lw	$2,8($fp)
	move	$sp,$fp
	lw	$fp,20($sp)
	addiu	$sp,$sp,24
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	string_length
	.size	string_length, .-string_length
	.align	2
	.globl	strings_not_equal
	.set	nomips16
	.ent	strings_not_equal
	.type	strings_not_equal, @function
strings_not_equal:
	.frame	$fp,48,$31		# vars= 16, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-48
	sw	$31,44($sp)
	sw	$fp,40($sp)
	move	$fp,$sp
	sw	$4,48($fp)
	sw	$5,52($fp)
	lw	$4,48($fp)
	.option	pic0
	jal	string_length
	nop

	.option	pic2
	sw	$2,36($fp)
	lw	$4,52($fp)
	.option	pic0
	jal	string_length
	nop

	.option	pic2
	sw	$2,32($fp)
	lw	$2,48($fp)
	nop
	sw	$2,28($fp)
	lw	$2,52($fp)
	nop
	sw	$2,24($fp)
	lw	$3,36($fp)
	lw	$2,32($fp)
	nop
	beq	$3,$2,$L108
	nop

	li	$2,1			# 0x1
	b	$L104
	nop

$L106:
	lw	$2,28($fp)
	nop
	lb	$3,0($2)
	lw	$2,24($fp)
	nop
	lb	$2,0($2)
	nop
	xor	$2,$3,$2
	sltu	$2,$0,$2
	andi	$2,$2,0x00ff
	lw	$3,28($fp)
	nop
	addiu	$3,$3,1
	sw	$3,28($fp)
	lw	$3,24($fp)
	nop
	addiu	$3,$3,1
	sw	$3,24($fp)
	beq	$2,$0,$L105
	nop

	li	$2,1			# 0x1
	b	$L104
	nop

$L108:
	nop
$L105:
	lw	$2,28($fp)
	nop
	lb	$2,0($2)
	nop
	bne	$2,$0,$L106
	nop

	move	$2,$0
$L104:
	move	$sp,$fp
	lw	$31,44($sp)
	lw	$fp,40($sp)
	addiu	$sp,$sp,48
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	strings_not_equal
	.size	strings_not_equal, .-strings_not_equal
	.align	2
	.globl	initialize_bomb
	.set	nomips16
	.ent	initialize_bomb
	.type	initialize_bomb, @function
initialize_bomb:
	.frame	$fp,32,$31		# vars= 0, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$fp,24($sp)
	move	$fp,$sp
	lui	$28,%hi(__gnu_local_gp)
	addiu	$28,$28,%lo(__gnu_local_gp)
	.cprestore	16
	lui	$2,%hi(sig_handler)
	addiu	$2,$2,%lo(sig_handler)
	li	$4,2			# 0x2
	move	$5,$2
	lw	$2,%call16(signal)($28)
	nop
	move	$25,$2
	jalr	$25
	nop

	lw	$28,16($fp)
	move	$sp,$fp
	lw	$31,28($sp)
	lw	$fp,24($sp)
	addiu	$sp,$sp,32
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	initialize_bomb
	.size	initialize_bomb, .-initialize_bomb
	.align	2
	.globl	blank_line
	.set	nomips16
	.ent	blank_line
	.type	blank_line, @function
blank_line:
	.frame	$fp,40,$31		# vars= 8, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-40
	sw	$31,36($sp)
	sw	$fp,32($sp)
	move	$fp,$sp
	lui	$28,%hi(__gnu_local_gp)
	addiu	$28,$28,%lo(__gnu_local_gp)
	.cprestore	16
	sw	$4,40($fp)
	lw	$2,40($fp)
	nop
	sw	$2,24($fp)
	b	$L112
	nop

$L114:
	lw	$2,%call16(__ctype_b_loc)($28)
	nop
	move	$25,$2
	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$3,0($2)
	lw	$2,24($fp)
	nop
	lb	$2,0($2)
	nop
	sll	$2,$2,1
	addu	$2,$3,$2
	lhu	$2,0($2)
	nop
	andi	$2,$2,0x2000
	sltu	$2,$2,1
	andi	$2,$2,0x00ff
	lw	$3,24($fp)
	nop
	addiu	$3,$3,1
	sw	$3,24($fp)
	beq	$2,$0,$L112
	nop

	move	$2,$0
	b	$L113
	nop

$L112:
	lw	$2,24($fp)
	nop
	lb	$2,0($2)
	nop
	bne	$2,$0,$L114
	nop

	li	$2,1			# 0x1
$L113:
	move	$sp,$fp
	lw	$31,36($sp)
	lw	$fp,32($sp)
	addiu	$sp,$sp,40
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	blank_line
	.size	blank_line, .-blank_line
	.align	2
	.globl	skip
	.set	nomips16
	.ent	skip
	.type	skip, @function
skip:
	.frame	$fp,40,$31		# vars= 8, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-40
	sw	$31,36($sp)
	sw	$fp,32($sp)
	move	$fp,$sp
	lui	$28,%hi(__gnu_local_gp)
	addiu	$28,$28,%lo(__gnu_local_gp)
	.cprestore	16
	b	$L118
	nop

$L120:
	nop
$L118:
	lw	$3,%got(input_strings)($28)
	lui	$2,%hi(num_input_strings)
	lw	$2,%lo(num_input_strings)($2)
	nop
	sll	$2,$2,4
	sll	$4,$2,2
	addu	$2,$2,$4
	addu	$3,$3,$2
	lw	$2,%got(infile)($28)
	nop
	lw	$2,0($2)
	move	$4,$3
	li	$5,80			# 0x50
	move	$6,$2
	lw	$2,%call16(fgets)($28)
	nop
	move	$25,$2
	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,24($fp)
	lw	$2,24($fp)
	nop
	beq	$2,$0,$L117
	nop

	lw	$4,24($fp)
	.option	pic0
	jal	blank_line
	nop

	.option	pic2
	lw	$28,16($fp)
	bne	$2,$0,$L120
	nop

$L117:
	lw	$2,24($fp)
	move	$sp,$fp
	lw	$31,36($sp)
	lw	$fp,32($sp)
	addiu	$sp,$sp,40
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	skip
	.size	skip, .-skip
	.rdata
	.align	2
$LC21:
	.ascii	"GRADE_BOMB\000"
	.align	2
$LC22:
	.ascii	"Error: Premature EOF on stdin\000"
	.align	2
$LC23:
	.ascii	"Error: Input line too long\000"
	.text
	.align	2
	.globl	read_line
	.set	nomips16
	.ent	read_line
	.type	read_line, @function
read_line:
	.frame	$fp,40,$31		# vars= 8, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-40
	sw	$31,36($sp)
	sw	$fp,32($sp)
	move	$fp,$sp
	lui	$28,%hi(__gnu_local_gp)
	addiu	$28,$28,%lo(__gnu_local_gp)
	.cprestore	16
	.option	pic0
	jal	skip
	nop

	.option	pic2
	lw	$28,16($fp)
	sw	$2,28($fp)
	lw	$2,28($fp)
	nop
	bne	$2,$0,$L122
	nop

	lw	$2,%got(infile)($28)
	nop
	lw	$3,0($2)
	lw	$2,%got(stdin)($28)
	nop
	lw	$2,0($2)
	nop
	beq	$3,$2,$L123
	nop

	lui	$2,%hi($LC21)
	addiu	$4,$2,%lo($LC21)
	lw	$2,%call16(getenv)($28)
	nop
	move	$25,$2
	jalr	$25
	nop

	lw	$28,16($fp)
	beq	$2,$0,$L124
	nop

	move	$4,$0
	lw	$2,%call16(exit)($28)
	nop
	move	$25,$2
	jalr	$25
	nop

$L124:
	lw	$2,%got(stdin)($28)
	nop
	lw	$3,0($2)
	lw	$2,%got(infile)($28)
	nop
	sw	$3,0($2)
	.option	pic0
	jal	skip
	nop

	.option	pic2
	lw	$28,16($fp)
	sw	$2,28($fp)
$L123:
	lw	$2,28($fp)
	nop
	bne	$2,$0,$L122
	nop

	lui	$2,%hi($LC22)
	addiu	$4,$2,%lo($LC22)
	lw	$2,%call16(puts)($28)
	nop
	move	$25,$2
	jalr	$25
	nop

	lw	$28,16($fp)
	.option	pic0
	jal	explode_bomb
	nop

	.option	pic2
	lw	$28,16($fp)
$L122:
	sw	$0,24($fp)
	b	$L125
	nop

$L126:
	lw	$2,24($fp)
	nop
	addiu	$2,$2,1
	sw	$2,24($fp)
$L125:
	lw	$2,24($fp)
	lw	$3,28($fp)
	nop
	addu	$2,$3,$2
	lb	$2,0($2)
	nop
	bne	$2,$0,$L126
	nop

	lw	$3,24($fp)
	li	$2,79			# 0x4f
	bne	$3,$2,$L127
	nop

	lui	$2,%hi($LC23)
	addiu	$4,$2,%lo($LC23)
	lw	$2,%call16(puts)($28)
	nop
	move	$25,$2
	jalr	$25
	nop

	lw	$28,16($fp)
	.option	pic0
	jal	explode_bomb
	nop

	.option	pic2
	lw	$28,16($fp)
$L127:
	lui	$2,%hi(num_input_strings)
	lw	$2,%lo(num_input_strings)($2)
	lw	$3,24($fp)
	nop
	addiu	$4,$3,-1
	lw	$3,%got(input_strings)($28)
	sll	$2,$2,4
	sll	$5,$2,2
	addu	$2,$2,$5
	addu	$2,$2,$4
	addu	$2,$3,$2
	sb	$0,0($2)
	lw	$3,%got(input_strings)($28)
	lui	$2,%hi(num_input_strings)
	lw	$2,%lo(num_input_strings)($2)
	nop
	sll	$2,$2,4
	sll	$4,$2,2
	addu	$2,$2,$4
	addu	$2,$3,$2
	sw	$2,28($fp)
	lui	$2,%hi(num_input_strings)
	lw	$2,%lo(num_input_strings)($2)
	nop
	addiu	$3,$2,1
	lui	$2,%hi(num_input_strings)
	sw	$3,%lo(num_input_strings)($2)
	lw	$2,28($fp)
	move	$sp,$fp
	lw	$31,36($sp)
	lw	$fp,32($sp)
	addiu	$sp,$sp,40
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	read_line
	.size	read_line, .-read_line
	.rdata
	.align	2
$LC24:
	.ascii	"\012BOOM!!!\000"
	.align	2
$LC25:
	.ascii	"The bomb has blown up.\000"
	.text
	.align	2
	.globl	explode_bomb
	.set	nomips16
	.ent	explode_bomb
	.type	explode_bomb, @function
explode_bomb:
	.frame	$fp,32,$31		# vars= 0, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$fp,24($sp)
	move	$fp,$sp
	lui	$28,%hi(__gnu_local_gp)
	addiu	$28,$28,%lo(__gnu_local_gp)
	.cprestore	16
	lui	$2,%hi($LC24)
	addiu	$4,$2,%lo($LC24)
	lw	$2,%call16(puts)($28)
	nop
	move	$25,$2
	jalr	$25
	nop

	lw	$28,16($fp)
	lui	$2,%hi($LC25)
	addiu	$4,$2,%lo($LC25)
	lw	$2,%call16(puts)($28)
	nop
	move	$25,$2
	jalr	$25
	nop

	lw	$28,16($fp)
	li	$4,8			# 0x8
	lw	$2,%call16(exit)($28)
	nop
	move	$25,$2
	jalr	$25
	nop

	.set	macro
	.set	reorder
	.end	explode_bomb
	.size	explode_bomb, .-explode_bomb
	.rdata
	.align	2
$LC26:
	.ascii	"%d %s\000"
	.align	2
$LC27:
	.ascii	"austinpowers\000"
	.align	2
$LC28:
	.ascii	"Curses, you've found the secret phase!\000"
	.align	2
$LC29:
	.ascii	"But finding it and solving it are quite different...\000"
	.align	2
$LC30:
	.ascii	"Congratulations! You've defused the bomb!\000"
	.text
	.align	2
	.globl	phase_defused
	.set	nomips16
	.ent	phase_defused
	.type	phase_defused, @function
phase_defused:
	.frame	$fp,120,$31		# vars= 88, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-120
	sw	$31,116($sp)
	sw	$fp,112($sp)
	move	$fp,$sp
	lui	$28,%hi(__gnu_local_gp)
	addiu	$28,$28,%lo(__gnu_local_gp)
	.cprestore	16
	lui	$2,%hi(num_input_strings)
	lw	$3,%lo(num_input_strings)($2)
	li	$2,6			# 0x6
	bne	$3,$2,$L134
	nop

	lw	$2,%got(input_strings)($28)
	nop
	addiu	$4,$2,240
	lui	$2,%hi($LC26)
	addiu	$3,$2,%lo($LC26)
	addiu	$2,$fp,104
	move	$5,$3
	move	$6,$2
	addiu	$2,$fp,24
	move	$7,$2
	lw	$2,%call16(__isoc99_sscanf)($28)
	nop
	move	$25,$2
	jalr	$25
	nop

	lw	$28,16($fp)
	move	$3,$2
	li	$2,2			# 0x2
	bne	$3,$2,$L133
	nop

	addiu	$2,$fp,24
	move	$4,$2
	lui	$2,%hi($LC27)
	addiu	$5,$2,%lo($LC27)
	.option	pic0
	jal	strings_not_equal
	nop

	.option	pic2
	lw	$28,16($fp)
	bne	$2,$0,$L133
	nop

	lui	$2,%hi($LC28)
	addiu	$4,$2,%lo($LC28)
	lw	$2,%call16(puts)($28)
	nop
	move	$25,$2
	jalr	$25
	nop

	lw	$28,16($fp)
	lui	$2,%hi($LC29)
	addiu	$4,$2,%lo($LC29)
	lw	$2,%call16(puts)($28)
	nop
	move	$25,$2
	jalr	$25
	nop

	lw	$28,16($fp)
	.option	pic0
	jal	secret_phase
	nop

	.option	pic2
	lw	$28,16($fp)
$L133:
	lui	$2,%hi($LC30)
	addiu	$4,$2,%lo($LC30)
	lw	$2,%call16(puts)($28)
	nop
	move	$25,$2
	jalr	$25
	nop

	lw	$28,16($fp)
$L134:
	move	$sp,$fp
	lw	$31,116($sp)
	lw	$fp,112($sp)
	addiu	$sp,$sp,120
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	phase_defused
	.size	phase_defused, .-phase_defused
	.data
	.align	2
	.type	array.3607, @object
	.size	array.3607, 16
array.3607:
	.byte	105
	.byte	115
	.byte	114
	.byte	118
	.byte	101
	.byte	97
	.byte	119
	.byte	104
	.byte	111
	.byte	98
	.byte	112
	.byte	110
	.byte	117
	.byte	116
	.byte	102
	.byte	103
	.ident	"GCC: (GNU) 4.4.4 20100726 (Red Hat 4.4.4-14)"
