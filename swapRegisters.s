#Program Name: swapRegisters.s
#Author: David Blossom
#Date: 29 June 2024
#Purpose: Swap registers using EOR commands and only two registers
#Input: value1 - integer; value2 - integer
#Output: output1 - string with the new values in each register

.text
.global main
main:

    #push the stack
    SUB sp, sp, #4
    STR lr, [sp, #0]

    #prompt user for first value
    LDR r0, =prompt1
    BL printf

    #read user input
    LDR r0, =value1Format
    LDR r1, =value1
    BL scanf

    #move input value to r4
    LDR r4, =value1
    LDR r4, [r4]

    #prompt user for inches input
    LDR r0, =prompt2
    BL printf

    #read user input
    LDR r0, =value2Format
    LDR r1, =value2
    BL scanf

    #move input to r5
    LDR r5, =value2
    LDR r5, [r5]

    #swap values in r4 and r5
    EOR r4, r4, r5
    EOR r5, r4, r5
    EOR r4, r4, r5

    #print swapped values
    MOV r1, r4
    MOV r2, r5
    LDR r0, =output1
    BL printf

    #pop the stack
    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr

.data
    #prompt user for feet input
    prompt1:        .asciz  "Enter the first integer: \n"
    #prompt user for inches input
    prompt2:        .asciz  "Enter the second integer: \n"
    #format for feet variable
    value1Format:   .asciz  "%d"
    #format for inches variable
    value2Format:   .asciz  "%d"
    #variable to hold feet value, initialized to 0
    value1:         .word   0
    #variable to hold inches value, initialized to 0
    value2:         .word   0
    #output string
    output1:        .asciz  "The value in the first register is now %d and the value in the second register is %d.\n"
