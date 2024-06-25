#Program Name: celsiusToFahrenheit.s
#Author: David Blossom
#Date: 25 June 2024
#Purpose: Convert an integer from Celsius to Fahrenheit
#Input: 
#Output:

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
    LDR r0, =celsiusFormat
    LDR r1, =celsiusValue
    BL scanf

    #load Celsius integer value into r0
    LDR r0, =celsiusValue
    LDR r0, [r0]

    #load immediate value from conversion formula into r1
    MOV r1, #9
    
    #multiply Celsius value by 9
    MUL r0, r0, r1

    #load immediate value from conversion formula into r1
    MOV r1, #5

    #perform division per conversion formula
    BL __aeabi_idiv

    #load immediate value from conversion formula into r1
    MOV r1, #32

    #perform addition per conversion formula; r0 has the converted value
    ADD r0, r0, r1

    #print converted value
    MOV r1, r0
    LDR r0, =output1
    BL printf

    #pop the stack
    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr

.data
    #prompt user for input
    prompt1:        .asciz  "Enter an integer temperature in Celsius: \n"
    #format for variable
    celsiusFormat:  .asciz  "%d"
    #variable to hold integer value, initialized to 0
    celsiusValue:   .word   0
    #output string
    output1:        .asciz  "The temperature in Fahrenheit is: %d\n"
