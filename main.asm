extern _soma
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

    MOV    AX, 3
    PUSH AX
    mov ax, 4
    push ax

    CALL _soma

    MOV BX, RESULT
    MOV [BX], AX

    exit:
    ; Fim do programa
    MOV     AH, 4CH
    INT     21H


%include "data.asm"

SEGMENT STACK STACK
RESB    256
STACKTOP: