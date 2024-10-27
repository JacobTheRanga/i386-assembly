        global  _start

        section .text
_start: mov     eax, 4                      ; write
        mov     ebx, 1                      ; stdout
        mov     ecx, msg                    ; buffer
        mov     edx, msg_len                ; size
        int     0x80
        
        add     esp, 4                      ; move stack down

_print: mov     eax, 4
        mov     ecx, num                    ; write arg num
        mov     edx, num_len
        int     0x80 

        mov     edx, 1                      ; 1 char write size
_char:  mov     eax, 4
        mov     ecx, [esp]                  ; write 1 char
        int     0x80

        inc     byte [esp]                  ; shift pointer to next char
        cmp     byte [ecx], 0               ; check if null character
        jne     _char

        mov     eax, 4
        mov     ecx, msg+msg_len-1          ; print endline char
        int     0x80

        add     esp, 4                      ; move stack down
        inc     byte [num+index]            ; increment displayed index num

        cmp     dword [esp], 0
        jne      _print                     ; repeat until all args are printed

        mov     eax, 1                      ; exit
        xor     ebx, ebx                    ; status 0
        int     0x80

        section .data
msg     db      "Provided arguments:", 10, 10
msg_len equ     $ - msg
num     db      '[0]: '
num_len equ     $ - num
index   equ     1