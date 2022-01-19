extern _soma, _mult, _div
extern _printString, _readString, _readOperator
extern _ascii2dec
SEGMENT CODE
..start:
    ; Stack setup
    MOV     AX, DATA
    MOV     DS, AX
    MOV     AX, STACK
    MOV     SS, AX
    MOV     SP, STACKTOP

    ; Print input
    ; MOV     DX, MSG
    ; PUSH    DX
    ; CALL    _printString

    ; Read operator
    MOV    AX, SELECTED_OP
    PUSH   AX
    CALL   _readOperator

    ; Read input
    MOV    AX, USR_INPUT_MAX_SIZE
    PUSH   AX
    CALL   _readString

    ; Convert input
    MOV     AX, USR_INPUT_BUFFER
    PUSH    AX
    MOV     AL, [USR_INPUT_ACTUAL_SIZE]
    MOV     AH, 0
    PUSH    AX
    MOV     AX, FST_OP
    PUSH    AX
    CALL    _ascii2dec
    
    
    ; MOV    AX, 270fh
    ; PUSH AX
    ; mov ax, 22b8h
    ; push ax
    ; MOV ax, RESULT
    ; PUSH AX
    
    ; int 3
    ; nop
    ; nop
    ; nop
    ; nop
    ; nop

    ; CALL _div

    exit:
    ; Fim do programa
    MOV     AH, 4CH
    INT     21H


%include "data.asm"

SEGMENT STACK STACK
RESB    256
STACKTOP: