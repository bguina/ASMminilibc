[BITS 64]
    global memmove:function
    global myasm_memmove:function
    section .text

memmove:
myasm_memmove:
    mov rax, rdi ; return the first argument
    mov r8, 0 ;i = 0

loop_push:
    cmp r8, rdx ; while i < n
    jge loop_write

    mov r9b, [rsi + r8]
    push r9 ;read and push the string
    inc r8
    jmp loop_push

loop_write_start:
    mov r8, 0 ; i = 0

loop_write:
    cmp r8, rdx ; while i < n
    jge end

    pop r9 ;pop and write the string
    mov [rdi + r8], r9b

    inc r8
    jmp loop_write
end:
    ret

