global _bin2ascii
; Função que converte um número binário em uma string ASCII
; retorno: null
; arg0: endereço do número a ser convertido
; arg1: destino da conversão
; Stack: 
; 0x0000 = BP
; 0x0002 = Endereço de retorno
; 0x0004 = arg1 char*
; 0x0006 = arg0 int32_t*
_bin2ascii:
    PUSH   BP
    MOV    BP,SP

    MOV    AX, [BP+6]
    MOV    DI, [BP+4]

    CMP    AX, 10
    JB     unidade
    CMP    AX, 100
    JB     dezena
    CMP    AX, 1000
    JB     centena
    CMP    AX, 10000
    JB     milhar

    dezMilhar:
        MOV            DX, 0
        MOV            BX, 10000
        DIV            BX
        ADD            AL, 30h
        MOV    BYTE    [DI], AL
        MOV            AX, DX
        INC            DI
    milhar:
    centena:
    dezena:
        MOV            BL, 10
        DIV            BL
        ADD            AL, 30h
        MOV    BYTE    AL, AH
        AND            AX, 0xFF
        INC            DI
    unidade:
        ADD            AL, 30h
        MOV    BYTE    [DI], AL
        MOV    BYTE    [DI+1], '$'
    POP    BP
    RET    2

   
