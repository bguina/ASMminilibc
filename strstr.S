[BITS 64]
    global strstr:function
    global myasm_strstr:function
    section .text

strstr:
myasm_strstr:
    mov rax, 0
loop:
    cmp byte [rdi], 0 ;while *s {
    je end

    mov r8, 0 ;i=0
loop_find:
    mov r10b, [rsi + r8]
    cmp r10b, 0 ;while n[i] {
    je found
    
    cmp byte [rdi + r8], r10b ;if s[i] != n[i]
    jne loop_end

    inc r8 ;i++
    jmp loop_find ;}

loop_end:
    inc rdi ;s++
    jmp loop ;}

found:
    mov rax, rdi
end:
    ret
