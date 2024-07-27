celsiusToFahrenheit: celsiusToFahrenheit.s
	gcc celsiusToFahrenheit.s -g -c -o celsiusToFahrenheit.o
	gcc celsiusToFahrenheit.o -g -o celsiusToFahrenheit -z noexecstack

fahrenheitToCelsius: fahrenheitToCelsius.s
	gcc fahrenheitToCelsius.s -g -c -o fahrenheitToCelsius.o
	gcc fahrenheitToCelsius.o -g -o fahrenheitToCelsius -z noexecstack

convertToNegative: convertToNegative.s
	gcc convertToNegative.s -g -c -o convertToNegative.o
	gcc convertToNegative.o -g -o convertToNegative -z noexecstack

convertToInches: convertToInches.s
	gcc convertToInches.s -g -c -o convertToInches.o	
	gcc convertToInches.o -g -o convertToInches -z noexecstack

convertToFeetAndInches: convertToFeetAndInches.s
	gcc convertToFeetAndInches.s -g -c -o convertToFeetAndInches.o
	gcc convertToFeetAndInches.o -g -o convertToFeetAndInches -z noexecstack

shiftMultiply: shiftMultiply.s
	gcc shiftMultiply.s -g -c -o shiftMultiply.o
	gcc shiftMultiply.o -g -o shiftMultiply -z noexecstack

swapRegisters: swapRegisters.s
	gcc swapRegisters.s -g -c -o swapRegisters.o
	gcc swapRegisters.o -g -o swapRegisters -z noexecstack
