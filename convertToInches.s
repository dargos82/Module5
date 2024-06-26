#Program Name: convertToInches.s
#Author: David Blossom
#Date: 25 June 2024
#Purpose: Convert two integers as feet and inches into the total number of inches
#Input: feetValue - integer; inchesValue - integer 
#Output: output1 - string with the total number of inches

.text
.global main
main:

    #push the stack
    SUB sp, sp, #4
    STR lr, [sp, #0]

    #prompt user for feet input
    LDR r0, =prompt1
    BL printf

    #read user input
    LDR r0, =feetFormat
    LDR r1, =feetValue
    BL scanf

    #load feet value into r2; convert to inches
    LDR r0, =feetValue
    LDR r0, [r0]
    MOV r1, #12
    MUL r7, r0, r1                  //r7 has feet in inches

    #prompt user for inches input
    LDR r0, =prompt2
    BL printf

    #read user input
    LDR r0, =inchesFormat
    LDR r1, =inchesValue
    BL scanf

    #load inches value into r3
    LDR r0, =inchesValue
    LDR r3, [r0]                    //r3 has inches from input

    #add inch values together
    ADD r0, r7, r3
    MOV r1, r0                      //r1 now has total number of inches

    #print converted value
    LDR r0, =output1
    BL printf

    #pop the stack
    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr

.data
    #prompt user for feet input
    prompt1:        .asciz  "Enter number of feet as an integer: \n"
    #prompt user for inches input
    prompt2:        .asciz  "Enter number of inches as an integer: \n"
    #format for feet variable
    feetFormat:     .asciz  "%d"
    #format for inches variable
    inchesFormat:   .asciz  "%d"
    #variable to hold feet value, initialized to 0
    feetValue:      .word   0
    #variable to hold inches value, initialized to 0
    inchesValue:    .word   0
    #output string
    output1:        .asciz  "Total number of inches is: %d\n"
