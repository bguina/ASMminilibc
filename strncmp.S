[BITS 64]
    global strncmp:function
    global myasm_strncmp:function
    section .text

strncmp:
myasm_strncmp:
    mov r8, 0 ;i = 0
    mov r10, 0
loop:
    cmp r8, rdx ;while i < n {
    jge notfound

    mov r9b, [rdi + r8]
    mov r10b, [rsi + r8]

    cmp r9b, r10b
    jne end
    
    cmp r9b, 0
    je notfound

    inc r8 ;i++
    jmp loop ;}

notfound:
    mov rax, 0
    ret

end:
    mov rax, 0
    mov al, r9b
    sub rax, r10
    ret

