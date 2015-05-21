[BITS 64]
    global rindex:function
    global myasm_rindex:function
    section .text

rindex:
myasm_rindex:
    mov rax, 0 ;r = 0
    mov r8, 0 ;i = 0

loop:
    mov r9b, [rdi + r8] ;r9b = s[i]
    cmp r9b, sil ;if r9b == c
    je store ;store

store_ret:
    cmp r9b, 0
    je done
    inc r8
    jmp loop

store:
    mov rax, rdi
    add rax, r8
    jmp store_ret

done:
    ret
