#Program Name: fahrenheitToCelsius.s
#Author: David Blossom
#Date: 25 June 2024
#Purpose: Convert an integer from Fahrenheit to Celsius
#Input: fahrenheitValue - integer value in Fahrenheit 
#Output: output1 - string with conversion to Celsius

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
    LDR r0, =fahrenheitFormat
    LDR r1, =fahrenheitValue
    BL scanf

    #load Fahrenheit integer value into r0
    LDR r0, =fahrenheitValue
    LDR r0, [r0]

    #load immediate value from conversion formula into r1
    MOV r1, #32

    #subtract 32 from the input value per conversion formula
    SUB r0, r0, r1

    #load immediate value 5 from conversion formula into r1
    MOV r1, #5
    
    #multiply subtracted value by 5
    MUL r0, r0, r1

    #load immediate value 9 from conversion formula into r1
    MOV r1, #9

    #perform division per conversion formula
    BL __aeabi_idiv

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
    prompt1:        .asciz  "Enter an integer temperature in Fahrenheit: \n"
    #format for variable
    fahrenheitFormat:  .asciz  "%d"
    #variable to hold integer value, initialized to 0
    fahrenheitValue:   .word   0
    #output string
    output1:        .asciz  "The temperature in Celsius is: %d\n"
