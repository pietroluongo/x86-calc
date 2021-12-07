global _div

; Função que divide dois números
; retorno: WORD AX result, DX remainder
; arg0: STACK WORD num1
; arg1: STACK WORD num2
; arg2: STACK WORD endereço de armazenamento do resultado

; Código equivalente:
; int32_t div(int16_t a, int16_t b, int32_t* res) {
;     int16_t tmp1 = a / b;
;     int16_t tmp2 = a % b;
;     int32_t tmp = (int32_t)tmp1 << 16 | tmp2;
;     *res = tmp;
;     return tmp;
; }

; Stack: 
; 0x0000 = BP
; 0x0002 = Endereço de retorno
; 0x0004 = arg2 res int32_t*
; 0x0006 = arg1 b   int16_t
; 0x0008 = arg0 a   int16_t
_div:
    ; Configuração da pilha
    PUSH    BP
    MOV     BP, SP

    MOV     AX, [BP + 8] ; int16_t a
    MOV     CX, [BP + 6] ; int16_t b
    MOV     BX, [BP + 4] ; int32_t* res
    MOV     DX, 0

    IDIV    CX
    MOV     [BX], AX
    MOV     [BX + 2], DX

    POP     BP
    RET     6