        global  _start

        section .text
_start: mov     eax, 4                  ; write syscall
        mov     ebx, 1                  ; stdout fd
        mov     ecx, msg                ; buffer
        mov     edx, len                ; size
        int     0x80                    ; call syscall int

        mov     eax, 1                  ; exit syscall
        xor     ebx, ebx                ; exit status 0
        int     0x80                    ; call syscall int

        section .data
msg     db      "Hello World!", 0xa     ; 0xa is ASCII newline
len     equ     $ - msg                 ; [curr] - [msg]