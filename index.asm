TITLE CreatFile
INCLUDE Irvine32.inc
BUFFER_SIZE = 1001
.data
buffer BYTE BUFFER_SIZE DUP(?)
filename BYTE "C:\Users\njoo.co.ke\Desktop\assemble.txt",0
fileHandle HANDLE ?
stringLength DWORD ?
bytesWritten DWORD ?
et1 BYTE "Cannot create file",0dh,0ah,0
et2 BYTE "Bytes written to file [assemble.txt]:",0
et3 BYTE "Please type anything and press Enter"
BYTE "[Enter]: ",0dh,0ah,0
.code
main PROC

mov edx,OFFSET filename
call CreateOutputFile
mov fileHandle,eax

cmp eax, INVALID_HANDLE_VALUE 
jne file_ok 
mov edx,OFFSET et1 
call WriteString
jmp quit
file_ok:

mov edx,OFFSET et3 
call WriteString
mov ecx,BUFFER_SIZE 
mov edx,OFFSET buffer
call ReadString
mov stringLength,eax 

mov eax,fileHandle
mov edx,OFFSET buffer
mov ecx,stringLength
call WriteToFile
mov bytesWritten,eax 
call CloseFile

mov edx,OFFSET et2 
call WriteString
mov eax,bytesWritten
call WriteDec
call Crlf
quit:
exit
main ENDP
END main
