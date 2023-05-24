.data
num1:
	.word 3
	.word 4
num2:
	.word 5
	.word 6
result:
	.word 0
	.word 0

.text
main:
	la $t0, num1 	# load address of num1 into $t0
	lw $t1, 0($t0) 	# load p of num1 into $t1
	lw $t2, 4($t0)	# load q of num1 into $t2
	
	la $t0, num2	# load address of num2 into $t0
	lw $t3, 0($t0)	# load p of num2 into $t3
	lw $t4, 4($t0)	# load q of num3 into $t4
	
	# multiply num1.p and num2.p
	mul $t1, $t1, $t3	# $t1 = $t1 * $t3
	
	# multiply num1.q and num2.q
	mul $t2, $t2, $t4	# $t2 = $t2 * $t4
	
	# store result
	la $t0, result 	# load address of result into #t0
	sw $t1, 0($t0)	# store p to result
	sw $t2, 4($t0)	# store q to result
	
	li $v0, 10
	syscall
	