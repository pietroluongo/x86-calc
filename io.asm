global _printString
; Imprime uma string na tela.
; retorno: nada
; arg0: DX WORD endereço da string a ser impressa
_printString:
    PUSH   BP
    MOV    BP, SP

    MOV    AH, 9
    MOV    DX, [BP + 4]
    INT    21h

    POP    BP
    RET 4