[BITS 64]
    global strcspn:function
    global myasm_strcspn:function
    section .text

strcspn:
myasm_strcspn:
    mov rax, 0 ;r = 0
loop:
    cmp byte [rdi], 0 ;while *s {
    je end

    mov r8, 0 ;i=0
loop_find:
    mov r10b, [rsi + r8]
    cmp r10b, 0 ;while n[i] {
    je loop_end_notfound
    
    cmp byte [rdi], r10b ;if *s == n[i]
    je end

    inc r8 ;i++
    jmp loop_find ;}

loop_end_notfound:
    inc rax ;r++
    inc rdi ;s++
    jmp loop ;}

end:
    ret
