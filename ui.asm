global _printNewline
_printNewline:
    MOV    DX, CLEAR_LINE
    MOV    AH, 9h
    INT    21h

    RET

SEGMENT DATA
CR            EQU     0Dh
LF            EQU     0Ah
MSG           DB      'Hello World Calculator', CR, LF, '$'
CLEAR_LINE    DB      CR, LF, '$'
WELCOME_MSG    DB    "Calculadora Inicializada", CR, LF, '$'
