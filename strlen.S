[BITS 64]
    global strlen:function
    global myasm_strlen:function
    section .text

strlen:
myasm_strlen:
    mov rax, 0 ;i = 0
loop:
    mov r8b, byte [rdi + rax] ;cl = s[i]
    cmp r8b, 0 ;if r8b == 0
    jz end ;return i;
    inc rax ;i++
    jmp loop
end:
    ret

