        global  _start

        section .text
print:  ; prologue - no function stack frame
        mov     ecx, [esp+4]                    ; Set ecx to 1st arg on stack
        mov     eax, [esp+8]                    ; Set ebx to 2nd arg on stack

        ; body
        mov     byte [ecx+len-2], al            ; Change buffer dependent on 2nd arg
        mov     eax, 4                          ; write
        mov     ebx, 1                          ; stdout
        ; ecx already set                       ; buffer
        mov     edx, len                        ; size
        int     0x80

        ; epilogue - no function stack frame
        ret
_start: push    '9'                             ; Push 2nd arg to stack
        push    foo                             ; Push 1st arg to stack
        call    print
        add     esp, 8                          ; Restore stack

        push    '3'
        push    foo
        call    print
        add     esp, 8

        push    '0'
        push    bar
        call    print
        add     esp, 8

        push    'A'
        push    baz
        call    print
        add     esp, 8

        push    '!'
        push    foo
        call    print
        add     esp, 8

        mov     eax, 1                          ; exit
        xor     ebx, ebx                        ; exit status 0
        int     0x80

        section .data
foo     db      "foo ", 0, 0xa
bar     db      "bar ", 0, 0xa
baz     db      "baz ", 0, 0xa
len     equ     $ - baz