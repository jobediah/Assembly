TITLE Programming Assignment #1

; Author: Jody Hansen							Email: hansejod@onid.oregonstate.edu
; Course / Project ID: CS271-400/Program1		Due Date: 04/12/2015
; Description: Program asks user to enter 2 numbers. The program calculates the sum,
; difference, product, remainder, and quotient. Results are then displayed.
; **EC: Calculates and display quotient as a floating point number
; **EC: Validates that the second number is smaller than the first

INCLUDE Irvine32.inc

.data
input1			DWORD	?			;integer 1 to be entered by user
input2			DWORD	?			;integer 2 to be entered by user
sum				DWORD	?			;holds result of the sum
difference		DWORD	?			;holds result of the difference
product			DWORD	?			;holds result of the product
quotient		DWORD	?			;holds result of the quotient
remainder		DWORD	?			;holds result of the remainder
decimal_1		DWORD	?			;holds result of floating point decimal place 1
decimal_2		DWORD	?			;holds result of floating point decimal place 2
decimal_3		DWORD	?			;holds result of floating point decimal place 3

program_title	BYTE	"Programming Assignment #1 ",0
extra_credit1	BYTE	"**EC: Calculates and displays quotient as a floating point number",0
extra_credit2	BYTE	"**EC: Validates that the second number is smaller than the first",0
owner_name		BYTE	"by Jody",0 
intro_1			BYTE	"Lets do some simple arithmatic! We will tell you the sum, difference, product, quotient, and remainder of two integers.", 0
prompt_1		BYTE	"Please enter your first integer: ", 0
prompt_2		BYTE	"Please enter your second integer: ", 0
repeat_input1	BYTE	"Your first number is: ", 0
repeat_input2	BYTE	"Your second number is: ", 0
result_message	BYTE	"The results are: ",0
warning_message	BYTE	"The second number entered needs to be smaller than your first.",0
result_sum		BYTE	" + ",0
result_sub		BYTE	" - ",0
result_mult		BYTE	" x ",0
result_div		BYTE	" / ",0
equals_sign		BYTE	" = ", 0
decimal_sign	BYTE	".",0
goodBye			BYTE	"Thanks for stopping by.", 0

.code
main PROC

; introduction
	; Displays the program title and owner
	mov		edx, OFFSET program_title
	call	WriteString
	
	mov		edx, OFFSET owner_name
	call	WriteString
	call	CrLf
	call	CrLf
	
	mov		edx, OFFSET extra_credit2
	call	WriteString
	call	CrLf

	mov		edx, OFFSET extra_credit1
	call	WriteString
	call	CrLf
	call	CrLf

	; Displays a description of subsequent program actions
	mov		edx, OFFSET intro_1
	call	WriteString
	call	CrLf
	call	CrLf

; get the data	
	; Prompts user to enter 1st integer
	mov		edx, OFFSET prompt_1
	call	WriteString
	call	ReadInt
	mov		input1, eax
	call	CrLf
	
	; Prompts user to enter 2nd integer

	jmp skip_warning

top:
	mov		edx, OFFSET warning_message
	call	WriteString
	call	CrLf

skip_warning:

	mov		edx, OFFSET prompt_2
	call	WriteString
	call	ReadInt
	mov		input2, eax
	call	CrLf

; **EC: Validate that the second number is smaller
	mov eax, input1
	mov ebx, input2
	cmp eax, ebx
	jl top

; calcuate the required values
	; sum the values
	mov		eax, input1
	mov		ebx, input2
	add		eax, ebx
	mov		sum, eax

	; subtract the values
	mov		eax, input1
	mov		ebx, input2
	sub		eax, ebx
	mov		difference, eax

	; multiply the values
	mov		eax, input1
	mov		ebx, input2
	mul		ebx
	mov		product, eax

	; divide the values
	mov		eax, input1
	cdq
	mov		ebx, input2
	div		ebx
	mov		quotient, eax
	mov		remainder, edx

; **EC: Calculate the decimal places
	mov eax, remainder
	mov ebx, 10
	mul ebx
	cdq
	mov ebx, input2
	div ebx
	mov decimal_1, eax
	mov remainder, edx

	mov eax, remainder
	mov ebx, 10
	mul ebx
	cdq
	mov ebx, input2
	div ebx
	mov decimal_2, eax
	mov remainder, edx

	mov eax, remainder
	mov ebx, 10
	mul ebx
	cdq
	mov ebx, input2
	div ebx
	mov decimal_3, eax
	mov remainder, edx

; display the results

	; displays the entered numbers
	mov		edx, OFFSET repeat_input1
	call	WriteString
	mov		eax, input1
	call	WriteDec
	call	CrLf

	mov		edx, OFFSET repeat_input2
	call	WriteString
	mov		eax, input2
	call	WriteDec
	call	CrLf
	call	CrLf

	; displays a results message
	mov		edx, OFFSET result_message
	call	WriteString
	call	CrLf
	call	CrLf
	
	; displays the sum
	mov		eax, input1
	call	WriteDec
	mov		edx, OFFSET result_sum
	call	WriteString
	mov		eax, input2
	call	WriteDec
	mov		edx, OFFSET equals_sign
	call	WriteString
	mov		eax, sum
	call	WriteDec
	call	CrLf

	; displays the difference
	mov		eax, input1
	call	WriteDec
	mov		edx, OFFSET result_sub
	call	WriteString
	mov		eax, input2
	call	WriteDec
	mov		edx, OFFSET equals_sign
	call	WriteString
	mov		eax, difference
	call	WriteDec
	call	CrLf

	; displays the product
	mov		eax, input1
	call	WriteDec
	mov		edx, OFFSET result_mult
	call	WriteString
	mov		eax, input2
	call	WriteDec
	mov		edx, OFFSET equals_sign
	call	WriteString
	mov		eax, product
	call	WriteDec
	call	CrLf

	; displays the division
	mov		eax, input1
	call	WriteDec
	mov		edx, OFFSET result_div
	call	WriteString
	mov		eax, input2
	call	WriteDec
	mov		edx, OFFSET equals_sign
	call	WriteString
	mov		eax, quotient
	call	WriteDec
	mov		edx, OFFSET decimal_sign
	call	WriteString
	mov		eax, decimal_1
	call	WriteDec
	mov		eax, decimal_2
	call	WriteDec
	mov		eax, decimal_3
	call	WriteDec
	call	CrLf
	call	CrLf

; say goodbye
	mov		edx, OFFSET goodBye
	call	WriteString
	call	CrLf
	call	CrLf

	exit	; exit to operating system
main ENDP

END main

