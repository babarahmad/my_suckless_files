; section  for initialized variables
section .data
    msg db "Welcome to Class of Computer Systems",10,0
    userMsg db 'Please enter a number: ' ;Ask the user to enter a number
    odd db "busybee",10,0
    even db "smartstart",10,0
    enroll db "fuzzbus",10,0
    totalSudentMsg db "Total Students are: ",0
   
    ; constant length of msg
    msg_L equ $-msg
    even_L equ $-even
    odd_L equ $-odd
    enroll_L equ $-enroll
    lenUserMsg equ $-userMsg             ;The length of the message
    totalmsg_L equ $-totalSudentMsg
    previousstudetns equ 40
    newstudetns equ 12
    total equ 42

; section for variables (uninitialized)
section .bss
    age resb 5
    
; actual code
section .text
    global _start ; need for gcc

_start: ;  Program start from here

    ; Printing Welcome message
    ; sys write func
    mov eax, 4
    ; on standard output         
    mov ebx, 1
    ; welcome message addr         
    mov ecx, msg        
    ; length of msg to print
    mov edx, msg_L 
    ; interuppt call
    int 0x80


  ; ask user for input
   mov eax, 4
   mov ebx, 1
   mov ecx, userMsg
   mov edx, lenUserMsg
   int 80h

   ;Read and store the user input
   mov eax, 3
   mov ebx, 2
   mov ecx, age  
   mov edx, 5          ;5 bytes (numeric, 1 for sign) of that information
   int 80h


    mov eax, age
    test eax,1
    jz isEven

    mov eax, 4
    ; on standard output         
    mov ebx, 1
    ; welcome message addr         
    mov ecx, odd        
    ; length of msg to print
    mov edx, odd_L 
    ; interuppt call
    int 0x80

    ; calc total students
    mov eax,previousstudetns
    mov ebx, newstudetns
    add eax,ebx
    mov edx,eax
   ; mov total,edx

    mov eax, 4
    ; on standard output         
    mov ebx, 1
    ; welcome message addr         
    mov ecx, totalSudentMsg       
    ; length of msg to print
    mov edx, totalmsg_L 
    ; interuppt call
    int 0x80

    mov edx, total
    ; sys write func
    mov eax, 4
    ; on standard output         
    mov ebx, 1
    ; print no         
    mov ecx, edx        
    ; interuppt call
    int 0x80


    ; call success exit to os
    ; Exit code
   mov eax, 1
   mov ebx, 0
   int 80h    





isEven:
       mov eax, 4
    ; on standard output         
    mov ebx, 1
    ; welcome message addr         
    mov ecx, even        
    ; length of msg to print
    mov edx, even_L 
    ; interuppt call
    int 0x80

    ; call success exit to os
    ; Exit code
   mov eax, 1
   mov ebx, 0
   int 80h