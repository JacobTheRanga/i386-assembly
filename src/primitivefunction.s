        global  _start

        section .text
func:   ; prologue
                ; push  (
        sub     esp, 4                          ; Allocate 4 bytes on stack for base pointer
        mov     dword [esp], ebp                ; Save previous base pointer to stack
                ; push  )
        mov     ebp, esp                        ; Move base pointer to stack pointer
        sub     esp, 8                          ; Allocate local space
        mov     dword [esp+4], msg              ; Define local variable 1
        mov     dword [esp], len                ; Define local variable 2

        ; body
        mov     eax, 4                          ; write syscall
        mov     ebx, 1                          ; stdout
        mov     ecx, dword [esp+4]              ; buffer
        mov     edx, dword [esp]                ; size
        int     0x80

        ; epilogue
                ; leave (
        mov     esp, ebp                        ; Move stack pointer to base pointer
                        ; pop   (
        mov     ebp, dword [esp]                ; Restore saved base pointer
        add     esp, 4                          ; Pop the 4 bytes for base pointer off the stack
                        ; pop   )
                ; leave )
                ; ret   (
                        ; pop   (
        mov     eax, dword [esp]                ; Restore return address
        add     esp, 4                          ; Pop the 4 bytes for the return address off the stack
                        ; pop   )
        jmp     eax                             ; Jump to return address
                ; ret   )

_start: ; call  (
                ; push  (
        sub     esp, 4                          ; Allocate 4 bytes on the stack for the return address
        mov     dword [esp], $+9                ; Store the address of the instruction after the jump
                ; push  )
        jmp     func                            ; Jump to the function
        ; call  )

        ; exit syscall
        mov     eax, 1                          ; exit syscall
        xor     ebx, ebx                        ; exit status 0
        int     0x80

        section .data
msg     db      "Printed from function!", 0xa
len     equ     $ - msg