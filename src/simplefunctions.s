        global  _start

        section .text
print:  push    ebp                     ; save previous base pointer to stack
        mov     ebp, esp                ; move base pointer to stack pointer
        sub     esp, 8                  ; allocate 8 bytes to the stack
        mov     -4[esp], ebx            ; move 1st argument into local allocated space
        mov     -8[esp], ecx            ; move 2nd argument into local allocated space
        mov     eax, 4                  ; write syscall
        mov     ebx, 1                  ; stdout

        ; leave
        mov     esp, ebp                ; shift stack pointer to base pointer
        pop     ebp                     ; restore base pointer

        ; ret
        pop     eip
        jmp     eip

chbar:  push    ebp
        mov     ebp, esp
        sub     esp

_start: push    strlen                  ; second argument
        push    ebx, str                ; first argument
        push    eip
        jmp     print

        mov     ebx, msg

        ; exit
        mov     eax, 1
        xor     ebx, ebx
        int 0x80

        section .data
str     db      "String: foo", 0xa
strlen  equ     $ - str
msg     db      "Message: foo", 0xa
msglen  equ     $ - msg