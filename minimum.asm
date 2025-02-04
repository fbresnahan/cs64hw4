# minimum.asm program
# CS 64, Z.Matni
#
# Get 3 integer inputs from the user (std.in)
# Reveal the minimum value
# See assignment description for details

#Data Area (i.e. memory setup directive)
.data
	# TODO: Complete these incomplete declarations / initializations

	enter: .asciiz "Enter number:\n"
   	new_line: .asciiz "\n"
	min: .asciiz "Minimum: "

#Text Area (i.e. instructions/code directive)
.text

main:

	# TODO: Write your code here
	li $v0, 4
	la $a0, enter
	syscall
	li $v0, 5
	syscall
	move $t0, $v0
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	move $t1, $v0
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	move $t2, $v0
	la $a0, min
	li $v0, 4
	syscall
	ble $t0, $t1, if1
else1:
	ble $t1, $t2, if2
	move $a0, $t2
	j print
if1:
	ble $t0, $t2, if3
	move $a0, $t2
	j print
if2:
	move $a0, $t1
	j print
if3:
	move $a0, $t0
print:
	li $v0, 1
	syscall
	la $a0, new_line
	li $v0, 4
	syscall
	
exit:
	# TODO: Write code to properly exit a SPIM simulation
	li $v0, 10
	syscall
