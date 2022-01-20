extern _bin2ascii
global _printNewline, _printFirstInputRequest, _printSecondInputRequest, _printOperatorRequest, _printResultMsg, _printErrorMsg, _printFormattedResult
_printNewline:
    MOV    DX, CLEAR_LINE
    JMP    doSyscall
    
_printFirstInputRequest:
    MOV    DX, FIRST_NUMBER_MSG
    JMP    doSyscall

_printSecondInputRequest:
    MOV    DX, SECOND_NUMBER_MSG
    JMP    doSyscall

_printOperatorRequest:
    MOV    DX, OPERATION_MSG
    JMP    doSyscall

_printResultMsg:
    MOV    DX, RESULT_MSG
    JMP    doSyscall

_printErrorMsg:
    MOV   DX, INVALID_OPERATION_MSG
    JMP   doSyscall

doSyscall:
    MOV    AH, 9h
    INT    21h
    RET

; Printa o resultado da operação de forma estruturada
; retorno: nada
; arg0: primeiro número da operação
; arg1: segundo número da operação
; arg2: operador da operação
; arg3: resultado da operação
; Stack: 
; 0x0000 = BP
; 0x0002 = Endereço de retorno
; 0x0004 = arg3 char*
; 0x0006 = arg2 char
; 0x0008 = arg1 char*
; 0x000A = arg0 char*
_printFormattedResult:
    PUSH    BP
    MOV     BP, SP
    
    int 3
    nop
    nop
    nop
    nop
    nop
    
    MOV     DX, [BP+0xA]
    PUSH    DX
    MOV     AX, FIRST_NUM_ASCII
    PUSH    AX
    CALL    _bin2ascii
    MOV     DX, [FIRST_NUM_ASCII]
    MOV     AH, 9h
    INT     21h
    
    MOV     DX, [BP+8]
    MOV     AH, 9
    INT     21h
    
    MOV     DL, [BP+6]
    MOV     AH, 5
    INT     21h
    
    MOV     DX, [BP+4]
    MOV     AH, 9
    INT     21h
    
    CALL _printNewline

    POP     BP
    RET     8

SEGMENT DATA
CR            EQU     0Dh
LF            EQU     0Ah
CLEAR_LINE    DB      CR, LF, '$'


WELCOME_MSG             DB      'Hello World Calculator', CR, LF, '$'
FIRST_NUMBER_MSG        DB      'Insira o primeiro numero: ', CR, LF, '$'
SECOND_NUMBER_MSG       DB      'Insira o segundo numero: ', CR, LF, '$'
OPERATION_MSG           DB      'Insira a operacao (+, -, *, /, q): ', CR, LF, '$'
RESULT_MSG              DB      'Resultado: ', CR, LF, '$'
INVALID_OPERATION_MSG   DB      'Erro: Operacao invalida!', CR, LF, '$'

FIRST_NUM_ASCII         DB       "000000"
SECOND_NUM_ASCII        DB       "000000"