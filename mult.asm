global _mult

; Função que soma dois números
; retorno: DWORD DX high, AX low
; arg0: STACK WORD num1
; arg1: STACK WORD num2
; arg2: STACK WORD endereço de armazenamento do resultado

; Código equivalente:
; int32_t mult(int16_t a, int16_t b, int32_t* res) {
;     int32_t tmp = a * b;
;     *res = tmp;
;     return tmp;
; }

; Stack: 
; 0x0000 = BP
; 0x0002 = Endereço de retorno
; 0x0004 = arg2 int32_t*
; 0x0006 = arg1 int16_t
; 0x0008 = arg0 int16_t
_mult:
    ; Configuração da pilha
    PUSH    BP
    MOV     BP, SP

    MOV     AX, [BP + 8] ; int16_t a
    MOV     CX, [BP + 6] ; int16_t b
    MOV     BX, [BP + 4] ; int32_t* res

    IMUL    CX
    MOV     [BX], AX
    MOV     [BX + 2], DX

    POP     BP
    RET     6