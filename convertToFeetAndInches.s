#Program Name: convertToFeetAndInches.s
#Author: David Blossom
#Date: 28 June 2024
#Purpose: Convert a single integer into feet and inches
#Input: inchesValue - integer 
#Output: output1 - string with the number of feet and inches

.text
.global main
main:

    #push the stack
    SUB sp, sp, #4
    STR lr, [sp, #0]

    #prompt user for total inches
    LDR r0, =prompt1
    BL printf

    #read user input
    LDR r0, =inchesFormat
    LDR r1, =inchesValue
    BL scanf

    #calculate number of feet; store in r7
    LDR r0, =inchesValue
    LDR r0, [r0]
    MOV r1, #12                     //move immediate 12 into r1
    BL __aeabi_idiv                 //divide total inches by 12; result in r0
    MOV r7, r0                      //r7 has number of feet

    #calculate number of remaining inches
    LDR r1, =inchesValue
    LDR r1, [r1]
    MOV r2, #12                     //move immediate 12 into r2
    MUL r0, r2, r7                  //calculate the number of inches in feet
    SUB r3, r1, r0                  //subtract number of inches in feet from total inches, store in r3

    #print result
    LDR r0, =output1
    MOV r1, r7                      //move r7 (number of feet) to r1
    MOV r2, r3                      //move r3 (remaining inches) to r2
    BL printf                       //print result

    #pop the stack
    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr

.data
    #prompt user for inches input
    prompt1:        .asciz  "Enter a number of inches as an integer: \n"
    #format for inches variable
    inchesFormat:     .asciz  "%d"
    #variable to hold inches value, initialized to 0
    inchesValue:    .word   0
    #output string
    output1:        .asciz  "You entered %d feet and %d inches.\n"
