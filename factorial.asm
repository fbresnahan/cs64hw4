# factorial.asm program
# CS 64, Z.Matni
#
# Assembly (NON-RECURSIVE) version of:
#   unsigned int n, fn=1;
#   cout << "Enter a number:\n";
#   cin >> n;
#   for (int x = 2; x <= n; x++)
#       fn = fn * x;
#   cout << "Factorial of " << x << " is:\n" << fn << "\n";

#Data Area (i.e. memory setup directive)
.data
	string1: .asciiz "Enter a number:\n"
	string2: .asciiz "Factorial of 1 is:\n"
	string3: .asciiz "\n"
#Text Area (i.e. instructions/code directive)
.text
main:
	la $a0, string1
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	move $t0, $v0
	la $a0, string2
	li $v0, 4
	syscall
	li $t1, 1
loop:
	beq $t0, $zero, print
	mult $t1, $t0
	mflo $t1
	addi $t0, $t0, -1
	j loop	
print:
	move $a0, $t1
	li $v0, 1
	syscall
	la $a0, string3
	li $v0, 4
	syscall

exit:
	li $v0, 10
	syscall
