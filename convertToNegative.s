#Program Name: convertToNegative.s
#Author: David Blossom
#Date: 25 June 2024
#Purpose: Convert an integer to its negative
#Input: integerValue - integer value 
#Output: output1 - string with the negative of the input value

.text
.global main
main:

    #push the stack
    SUB sp, sp, #4
    STR lr, [sp, #0]

    #prompt user for input
    LDR r0, =prompt1
    BL printf

    #read user input
    LDR r0, =integerFormat
    LDR r1, =integerValue
    BL scanf

    #load integer value into r0
    LDR r0, =integerValue
    LDR r0, [r0]

    #get the 1s complement of r0, move to r1
    MVN r1, r0
    
    #get the 2s complement by adding 1
    ADD r0, r1, #1

    #move value to r1
    MOV r1, r0

    #print converted value
    LDR r0, =output1
    BL printf

    #pop the stack
    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr

.data
    #prompt user for input
    prompt1:        .asciz  "Enter an integer: \n"
    #format for variable
    integerFormat:  .asciz  "%d"
    #variable to hold integer value, initialized to 0
    integerValue:   .word   0
    #output string
    output1:        .asciz  "The negative of this integer is: %d\n"
