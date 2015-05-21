[BITS 64]
    global strpbrk:function
    global myasm_strpbrk:function
    section .text

strpbrk:
myasm_strpbrk:
    mov rax, 0
loop:
    cmp byte [rdi], 0 ;while *s {
    je end

    mov r8, 0 ;i=0
loop_find:
    mov r10b, [rsi + r8]
    cmp r10b, 0 ;while n[i] {
    je loop_end
    
    cmp byte [rdi], r10b ;if *s == n[i]
    je found

    inc r8 ;i++
    jmp loop_find ;}

loop_end:
    inc rdi ;s++
    jmp loop ;}

found:
    mov rax, rdi
end:
    ret
