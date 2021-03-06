extern _soma, _mult, _div, _sub
extern _printString, _readString, _readOperator
extern _ascii2dec, _bin2ascii
extern _printNewline
extern _printNewline, _printFirstInputRequest, _printSecondInputRequest, _printOperatorRequest, _printResultMsg, _printErrorMsg

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
        CALL   _printOperatorRequest
        MOV    AX, SELECTED_OP
        PUSH   AX
        CALL   _readOperator

        MOV    AL, [SELECTED_OP]
        CMP    AL, 'q'
        JNE    shouldAskForNumbers
        JMP    exit

    shouldAskForNumbers:
        CALL _printNewline
        ; Read first number input
        CALL   _printFirstInputRequest
        MOV    AX, USR_INPUT_MAX_SIZE
        PUSH   AX
        CALL   _readString

        CALL _printNewline


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
        CALL  _printSecondInputRequest
        MOV    AX, USR_INPUT_MAX_SIZE
        PUSH   AX
        CALL   _readString

        CALL _printNewline

        ; Convert second number input
        MOV     AX, USR_INPUT_BUFFER
        PUSH    AX
        MOV     AL, [USR_INPUT_ACTUAL_SIZE]
        MOV     AH, 0
        PUSH    AX
        MOV     AX, SND_OP
        PUSH    AX
        CALL    _ascii2dec

    ; Move results to BX
    MOV    BL, [SELECTED_OP]

    ; Load data for actual functions on the stack
    MOV     AX, [FST_OP]
    PUSH    AX
    MOV     AX, [SND_OP]
    PUSH    AX
    MOV     AX, RESULT
    PUSH    AX

    CMP   BL, '+'
    JE    handleAdd
    CMP   BL, '-'
    JE    handleSubtract
    CMP   BL, '*'
    JE    handleMultiply
    CMP   BL, '/'
    JE    handleDivide
    JMP            handleInputError
    handleAdd:
        CALL    _soma
        JMP     calculatorFlowEnd
    handleSubtract:
        CALL    _sub
        JMP     calculatorFlowEnd
    handleMultiply:
        CALL    _mult
        JMP     calculatorFlowEnd
    handleDivide:
        CALL    _div
        JMP     calculatorFlowEnd
    calculatorFlowEnd:
        CALL   _printResultMsg

        INT 3
        NOP
        NOP
        NOP
        NOP
        NOP

        MOV    AX, [RESULT]
        PUSH   AX
        MOV    AX, RESULT_ASCII
        PUSH   AX
        CALL   _bin2ascii
        MOV    DX, RESULT_ASCII
        MOV    AH, 9
        INT    21h
        ; MOV    AX, [FST_OP]
        ; PUSH   AX
        ; MOV    AX, [SND_OP]
        ; PUSH   AX
        ; MOV    AX, [SELECTED_OP]
        ; PUSH   AX
        ; MOV    AX, RESULT_ASCII
        ; PUSH   AX
        CALL   _printNewline
        JMP    initialCalculatorFlow
    handleInputError:
        ; TODO: Print error message
        CALL   _printErrorMsg
        JMP    initialCalculatorFlow
    
    exit:
    ; Fim do programa
    MOV     AH, 4CH
    INT     21H


%include "data.asm"

SEGMENT STACK STACK
RESB    256
STACKTOP: