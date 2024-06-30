#Program Name: shiftMultiply.s
#Author: David Blossom
#Date: 29 June 2024
#Purpose: Use shift operations to multiply an integer by 10
#Input: integerValue - integer value 
#Output: output1 - string with the multiplied value

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

    #load integer value into r4
    LDR r4, =integerValue
    LDR r4, [r4]

    #multiply integerValue by 8 using shift operations; store in r4
    LSL r5, r4, #3                  //r5 has original value times 8

    #multiply integerValue by 2 using shift operations; store in r5
    LSL r6, r4, #1                  //r6 has original value times 2

    #Add multiplied values
    ADD r1, r5, r6                  //r1 has sum of multiplied values

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
    output1:        .asciz  "The original value times 10 is: %d\n"
