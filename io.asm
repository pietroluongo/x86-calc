global _printString, _readString, _readOperator
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
    RET 2
    
; Lê uma string da entrada padrão
; retorno: nada
; arg0: DX WORD endereço de armazenamento da string
; Stack: 
; 0x0000 = BP
; 0x0002 = Endereço de retorno
; 0x0004 = arg0 int32_t*
_readString:
    PUSH   BP
    MOV    BP, SP

    MOV    AH, 0Ah
    MOV    DX, [BP + 4]
    INT    21h

    POP    BP
    RET 2

; Lê um caractere da entrada padrão da operação da calculadora
; retorno: nada
; arg0: DX WORD endereço de armazenamento do caractere
; Stack:
; 0x0000 = BP
; 0x0002 = Endereço de retorno
; 0x0004 = arg0 char*
_readOperator:
    PUSH    BP
    MOV     BP, SP
    
    MOV     AH, 1h
    INT     21h
    MOV     BX, [BP + 4]
    MOV     [BX], AL

    POP     BP
    RET     2