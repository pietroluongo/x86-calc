extern _soma, _mult, _div, _sub
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


    initialCalculatorFlow:
        ; Read operator
        MOV    AX, SELECTED_OP
        PUSH   AX
        CALL   _readOperator

        ; Read first number input
        MOV    AX, USR_INPUT_MAX_SIZE
        PUSH   AX
        CALL   _readString

        ; Convert first number input
        MOV     AX, USR_INPUT_BUFFER
        PUSH    AX
        MOV     AL, [USR_INPUT_ACTUAL_SIZE]
        MOV     AH, 0
        PUSH    AX
        MOV     AX, FST_OP
        PUSH    AX
        CALL    _ascii2dec

        ; Read second number input
        MOV    AX, USR_INPUT_MAX_SIZE
        PUSH   AX
        CALL   _readString

        ; Convert second number input
        MOV     AX, USR_INPUT_BUFFER
        PUSH    AX
        MOV     AL, [USR_INPUT_ACTUAL_SIZE]
        MOV     AH, 0
        PUSH    AX
        MOV     AX, SND_OP
        PUSH    AX
        CALL    _ascii2dec

    int 3
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop


    MOV    BL, [SELECTED_OP]
    MOV    DL, [SELECTED_OP]
    MOV    DH, 0
    MOV    BH, 0
    MOV    AH, 2
    INT    21H

    ; Load data for actual functions
    MOV     AX, [FST_OP]
    PUSH    AX
    MOV     AX, [SND_OP]
    PUSH    AX
    MOV     AX, RESULT
    PUSH    AX

    CMP   BX, '+'
    JE    handleAdd
    CMP   BX, '-'
    JE    handleSubtract
    CMP   BX, '*'
    JE    handleMultiply
    CMP   BX, '/'
    JE    handleDivide
    CMP   BX, 'q'
    JE    handleQuit
    JMP            handleInputError
    handleAdd:
        CALL    _soma
        JMP     initialCalculatorFlow
    handleSubtract:
        CALL    _sub
        JMP     initialCalculatorFlow
    handleMultiply:
        CALL    _mult
        JMP     initialCalculatorFlow
    handleDivide:
        CALL    _div
        JMP     initialCalculatorFlow
    handleQuit:
        JMP    exit
    calculatorFlowEnd:
        JMP    initialCalculatorFlow
    handleInputError:
        ; TODO: Print error message
        JMP    initialCalculatorFlow
    
    exit:
    ; Fim do programa
    MOV     AH, 4CH
    INT     21H


%include "data.asm"

SEGMENT STACK STACK
RESB    256
STACKTOP: