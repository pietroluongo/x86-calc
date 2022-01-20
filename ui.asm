global _printNewline, _printFirstInputRequest, _printSecondInputRequest, _printOperatorRequest, _printResultMsg, _printErrorMsg
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