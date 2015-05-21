[BITS 64]
    global strcmp:function
    global myasm_strcmp:function
    section .text

strcmp:
myasm_strcmp:
    mov r8, 0 ;i = 0
    mov r10, 0
loop:
    mov r9b, [rdi + r8]
    mov r10b, [rsi + r8]

    cmp r9b, r10b
    jne end
    
    cmp r9b, 0
    je end

    inc r8 ;i++
    jmp loop

end:
    mov rax, 0
    mov al, r9b
    sub rax, r10
    ret

