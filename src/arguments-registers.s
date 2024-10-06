        global  _start

        section .text
_add:   ; No stack frame to save

        mov     al, bl                      ; Copy 1st arg into 'a' reg
        add     al, cl                      ; Perform arithmatic with 2nd arg
        
        ; Change strings
        add     al, 0x30                    ; Offset numbers to their ASCII counterpart
        mov     byte [out_msg+res_out], al  ; Change char at index to ASCII num
        add     bl, 0x30
        mov     byte [in_msg+a_in], bl
        mov     byte [out_msg+a_out], bl
        add     cl, 0x30
        mov     byte [in_msg+b_in], cl
        mov     byte [out_msg+b_out], cl

        ; Invoke print of input values
        mov     eax, 4                      ; write
        mov     ebx, 1                      ; stdout
        mov     ecx, in_msg                 ; buffer
        mov     edx, in_len                 ; size
        int     0x80

        mov     byte [out_msg+op_out], '+'  ; Change char at index to ASCII arithmatic operator

        ; Invoke print of result
        mov     eax, 4
        ; ebx already set
        mov     ecx, out_msg
        mov     edx, out_len
        int     0x80

        ; no stack frame to restore
        ret
_sub:   mov     al, bl
        sub     al, cl

        add     al, 0x30
        mov     byte [out_msg+res_out], al
        add     bl, 0x30
        mov     byte [in_msg+a_in], bl
        mov     byte [out_msg+a_out], bl
        add     cl, 0x30
        mov     byte [in_msg+b_in], cl
        mov     byte [out_msg+b_out], cl

        mov     eax, 4
        mov     ebx, 1
        mov     ecx, in_msg
        mov     edx, in_len
        int     0x80

        mov     byte [out_msg+op_out], '-'

        mov     eax, 4
        mov     ecx, out_msg
        mov     edx, out_len
        int     0x80

        ret
_start: mov     ebx, 3                      ; 1st Argument
        mov     ecx, 5                      ; 2nd Argument
        call    _add

        mov     ebx, 8
        mov     ecx, 7
        call    _sub

        mov     ebx, 9
        mov     ecx, 2
        call    _sub

        mov     ebx, 7
        mov     ecx, 1
        call    _add

        mov     eax, 1
        xor     ebx, ebx
        int     0x80

        section .data
in_msg  db      "a = ",0,10,"b = ",0,10
in_len  equ     $ - in_msg
a_in    equ     (in_len / 2) - 2
b_in    equ     in_len - 2
out_msg db      "a $ b = ",0,10,10
out_len equ     $ - out_msg
op_out  equ     2
a_out   equ     0
b_out   equ     4
res_out equ     out_len - 3