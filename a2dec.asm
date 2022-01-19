global _ascii2dec
; Função que converte uma string ASCII em um número decimal.
; retorno: null
; arg0: endereço da string ASCII
; arg1: tamanho da string ASCII
; arg2: endereço de onde armazenar o número decimal
; Stack: 
; 0x0000 = BP
; 0x0002 = Endereço de retorno
; 0x0004 = arg2 int32_t*
; 0x0006 = arg1 int32_t
; 0x0008 = arg0 int32_t*
_ascii2dec:
    PUSH   BP
    MOV    BP, SP

    MOV    WORD    [CONV_ACCUMULATOR], 0

    MOV            BX, [BP+8] ; BX = arg0
    MOV            CX, [BP+6] ; CX = arg1
    
    MOV            DI, CX
    DEC            DI         ; DI aponta para o último caractere da string
    
    MOV            SI, 1      ; SI é o multiplicador
    
    ; Checa se o número é negativo
    MOV    AX, 0
    MOV    AL, [BX]
    CMP    AL, '-'
    JNE    conv_loop
    DEC    CX

    conv_loop:
        MOV    AX, 0
        MOV    AL, [BX + DI]
        SUB    AL, 30h
        MUL    SI
        
        ADD    [CONV_ACCUMULATOR], AX

        ; Incrementa o multiplicador
        MOV    AX, SI
        MOV    SI, 10
        MUL    SI
        MOV    SI, AX

        DEC    DI
        LOOP   conv_loop
    
    JNE            a2dec_end
    NEG    WORD    [CONV_ACCUMULATOR]

    a2dec_end:
        MOV    BX, [BP+4]
        MOV    AX, [CONV_ACCUMULATOR]
        MOV    WORD [BX], AX
        POP    BP
        RET    6

SEGMENT DATA
CONV_ACCUMULATOR    DW    0


