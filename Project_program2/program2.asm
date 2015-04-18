TITLE Programming Assignment #2

; Author: Jody Hansen							Email: hansejod@onid.oregonstate.edu
; Course / Project ID: CS271-400/Program2		Due Date: 04/19/2015
; Description: Prompts user to enter the nth Fibonacci number the user would like 
; to have the program calculate. 
; **EC: display the numbers in aligned columns

INCLUDE Irvine32.inc

MAXVALUE = 47

.data
input_number	DWORD	?			;integer 1 to be entered by user

message_title	BYTE	"Programming Assignment #2 ",0
message_ec		BYTE	"**EC: display the numbers in aligned columns",0
owner_name		BYTE	"by Jody",0 

prompt_name		BYTE	"What is your name? ", 0
input_username	BYTE	33 DUP(0)
message_hello	BYTE	"Hello ", 0

prompt_intruc	BYTE	"Please enter the number of Fibonacci terms to be displayed (1-46)", 0
message_warning	BYTE	"Out of range. Enter a number between 1 and 46.",0
message_result	BYTE	"Results certified by ",0

message_goodBye	BYTE	"Thanks for stopping by ", 0

rows			BYTE	?
cols			BYTE	?

.code
main PROC

; introduction
	; Displays the program title and owner
	mov		edx, OFFSET message_title
	call	WriteString
	
	mov		edx, OFFSET owner_name
	call	WriteString
	call	CrLf
	
	mov		edx, OFFSET message_ec
	call	WriteString
	call	CrLf
	call	CrLf

	; get users name and say hello
	mov		edx, OFFSET prompt_name
	call	WriteString
	mov		edx, OFFSET input_username
	mov		ecx, 32
	call	ReadString
	
	mov		edx, OFFSET message_hello
	call	WriteString
	mov		edx, OFFSET input_username
	call	WriteString
	call	CrLf
	call	CrLf


; userInstructions
	mov		edx, OFFSET prompt_intruc
	call	WriteString
	call	CrLf
	call	CrLf

; getUserData	
	
	jmp skipWarning

inputLoop:
	mov		edx, OFFSET message_warning
	call	WriteString
	call	CrLf

skipWarning:
	call	ReadInt
	mov		input_number, eax
	cmp eax, 1
	jl inputLoop
	cmp eax, MAXVALUE
	jg inputLoop
		
; displayFibs
	mov eax, 1
	mov ecx, input_number
	mov ebx, 0
	mov edx, 0

fibLoop:
	; calculate fibonacci sequence
	call WriteDec
	;call GetMaxXy
	;mov rows, al
	;mov cols, dl
	;add rows, 5
	;add cols, 5
	mov edx, eax
	add eax, ebx
	mov ebx, edx
	;mov dh, rows
	;mov dl, cols
	loop fibLoop
	
; farewell
	mov		edx, OFFSET message_result
	call	WriteString
	mov		edx, OFFSET owner_name
	call	WriteString
	call	CrLf
	
	mov		edx, OFFSET message_goodBye
	call	WriteString
	mov		edx, OFFSET input_username
	call	WriteString
	call	CrLf
	call	CrLf

	exit	; exit to operating system
main ENDP

END main

