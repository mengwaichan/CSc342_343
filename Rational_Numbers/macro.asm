.macro print_rational(%p, %q)
	.data
		str_rational: .asciiz "rational("
		slash: .asciiz "/"
		newLine: .asciiz ")\n"
	.text
	li $v0, 4
	la $a0, str_rational
	syscall
	li $v0, 1
	move $a0, %p
	syscall
	
	li $v0, 4
	la $a0, slash
	syscall
	
	li $v0, 1
	move $a0, %q
	syscall
	
	li $v0, 4
	la $a0, newLine
	syscall
.end_macro

.macro is_rational(%p, %q)
	.data
		str_notRational: .asciiz "Invalid Rational Number"
	.text
	move $t0, %q
	beq $t0, $zero, invalid
	li $v0, 10
	syscall
	
	invalid:
		li $v0, 4
		la $a0, str_notRational
		syscall	 
.end_macro

.macro add_rational(%p1, %q1, %p2, %q2)
	.text
		mult %p1, %q2
		mflo $t0
		mult %p2, %q1
		mflo $t1
		mult %q1, %q2
		mflo $t2
		
		add $t0, $t0, $t1
		
		print_rational($t0, $t2)
		
		li $v0, 10
.end_macro

.macro sub_rational(%p1, %q1, %p2, %q2)
	.text
		mult %p1, %q2
		mflo $t0
		mult %p2, %q1
		mflo $t1
		mult %q1, %q2
		mflo $t2
		
		sub $t0, $t0, $t1
		
		print_rational($t0, $t2)
		
		li $v0, 10
.end_macro

.macro mul_rational(%p1, %q1, %p2, %q2)
	.text
		mult %p1, %p2
		mflo $t0
		mult %q1, %q2
		mflo $t1
				
		print_rational($t0, $t1)
		
		li $v0, 10
.end_macro

.macro div_rational(%p1, %q1, %p2, %q2)
	.text
		mult %p1, %q2
		mflo $t0
		mult %q1, %p2
		mflo $t1
				
		print_rational($t0, $t1)
		
		li $v0, 10
.end_macro

.text
main:
	addi $s0, $0, 1
	addi $s1, $0, 2
	addi $s2, $0, 1
	addi $s3, $0, 4
	
	add_rational($s0,$s1,$s2,$s3)
	sub_rational($s0,$s1,$s2,$s3)
	mul_rational($s0,$s1,$s2,$s3)
	div_rational($s0,$s1,$s2,$s3)
	
	print_rational($s0, $s1)
	
	addi $s4, $0, 1
	addi $s5, $0, 0
	is_rational($s4, $s5)

	li $v0, 10
	syscall