.data
a: .word 8
b: .word 24

.text
.globl main
main:
    lw $a0,a 
    lw $a1,b 
    jal gcd 
    add $a0,$v0,$zero 
    li $v0,1
    syscall
li $v0, 10 
syscall

gcd:
    addi $sp, $sp, -12
    sw $ra, 0($sp) 
    sw $s0, 4($sp) 
    sw $s1, 8($sp) 
    
    add $s0, $a0, $zero 
    add $s1, $a1, $zero 
    addi $t1, $zero, 0 
    beq $s1, $t1, return  
    add $a0, $zero, $s1 
    div $s0, $s1 
    mfhi $a1 

    jal gcd

exit:
    lw $ra, 0 ($sp) 
    lw $s0, 4 ($sp)
    lw $s1, 8 ($sp)
    addi $sp,$sp , 12
    jr $ra
return:
    add $v0, $zero, $s0
    j exit
