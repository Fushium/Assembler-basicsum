TITLE MASM Template	(addusb2.asm) 
INCLUDE Irvine32.inc 

.data 

inputInt1 BYTE "Input the 1st integer: ",0 
inputInt2 BYTE "Input the 2nd integer: ",0 
outputSum BYTE "The sum of the two integers: ",0 

integer1	DWORD ? 
integer2	DWORD ? 
sum			DWORD ? 

.code 
main PROC 
call Clrscr ; clear screen 

;First value
mov dl, 40 ; set the column 
mov dh, 12 ; set the row 
call Gotoxy ; move the cursor to near the center 

mov edx,OFFSET inputInt1 ; Ask user for first integer
call WriteString 

call ReadInt ; read integer 
mov integer1, eax ; store the value 

;Second value
mov dl, 40 ; set the column 
mov dh, 13 ; set the row 
call Gotoxy ; move the cursor to near the center 

mov edx,OFFSET inputInt2 ; ask user for second integer
call WriteString 

call ReadInt ; read integer 
mov integer2, eax ; store the value 

; compute the sum 
mov eax, integer2 
add	eax, integer1 
mov sum, eax 

; output result 
mov dl, 40 ; set the column 
mov dh, 14 ; set the row 
call Gotoxy ; move the cursor to near the center 

mov edx, OFFSET outputSum 
call WriteString 

mov eax, sum 
call WriteInt 

; "Press any key..."
mov dl, 40 ; set the column 
mov dh, 15 ; set the row 
call Gotoxy ; move the cursor to near the center 
call WaitMsg

exit 
main ENDP 
END main
