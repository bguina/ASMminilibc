[BITS 64]
    global memset:function
    global myasm_memset:function
    section .text

memset:
myasm_memset:
    mov rax, rdi ;return the first argument
    mov r8, 0 ;i = 0
loop:
    cmp r8, rdx ; while i < n
    jge end

    mov [rdi + r8], sil ;s[i] = c
    
    inc r8 ;i++
    jmp loop
end:
    ret

