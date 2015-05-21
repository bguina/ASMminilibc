[BITS 64]
    global strcasecmp:function
    global myasm_strcasecmp:function
    section .text

strcasecmp:
myasm_strcasecmp:
    mov r8, 0 ;i = 0
    mov r10, 0

loop:
    mov r9b, [rdi + r8]
    mov r10b, [rsi + r8]

lower1: ;lower r9b
    cmp r9b, 65
    jl lower2
    cmp r9b, 90
    jg lower2
    add r9b, 32

lower2: ;lower r10b
    cmp r10b, 65
    jl loop_compare
    cmp r10b, 90
    jg loop_compare
    add r10b, 32

loop_compare:

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

