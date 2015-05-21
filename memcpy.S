[BITS 64]
    global memcpy:function
    global myasm_memcpy:function
    section .text

memcpy:
myasm_memcpy:
    mov rax, rdi ; return the first argument
    mov r8, 0 ;i = 0
loop:
    cmp r8, rdx ; while i < n
    jge end

    mov r9b, [rsi + r8] ;r9b = s[i]
    mov [rdi + r8], r9b ;d[i] = r9b

    inc r8 ;i++
    jmp loop
end:
    ret

