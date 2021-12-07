extern _soma, _mult
extern _printString
SEGMENT CODE
..start:
    MOV     AX, DATA
    MOV     DS, AX
    MOV     AX, STACK
    MOV     SS, AX
    MOV     SP, STACKTOP
    MOV     AH, 9

    MOV     DX, MSG
    PUSH    DX
    CALL    _printString

    MOV    AX, 270fh
    PUSH AX
    mov ax, 270Ah
    push ax
    MOV ax, RESULT
    PUSH AX
    
    int 3
    nop
    nop
    nop
    nop
    nop

    CALL _mult

    exit:
    ; Fim do programa
    MOV     AH, 4CH
    INT     21H


%include "data.asm"

SEGMENT STACK STACK
RESB    256
STACKTOP: