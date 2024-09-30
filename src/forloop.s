        global  _start

        section .text
_start: mov     ebx, 1                  ; stdout
        mov     ecx, msg                ; buffer
        mov     edx, len                ; size
loop:   mov     eax, 4                  ; write
        int     0x80
        inc     byte [ecx+len-2]        ; ++i
        cmp     byte [ecx+len-2], '9'   ; i <= 9
        jle     loop

        mov     eax, 1                  ; exit
        xor     ebx, ebx                ; exit status 0
        int     0x80

        section .data
msg     db      "Loop ", '0', 0xa       ; i = 0
len     equ     $ - msg