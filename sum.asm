global _soma

; Função de soma de dois números
; retorno: EAX   WORD número resultante da soma
; arg0:    STACK WORD número 1
; arg1:    STACK WORD número 2
; arg2:    STACK WORD endereço de armazenamento do resultado

; Código equivalente:
; int16_t soma(int16_t a, int16_t b, int16_t* res) {
;    int16_t tmp = a + b;
;    *res = tmp;
;    return tmp;
; }

; Stack: 
; 0x0000 = BP
; 0x0002 = Endereço de retorno
; 0x0004 = arg2 int32_t*
; 0x0006 = arg1 int16_t
; 0x0008 = arg0 int16_t

_soma:
    ; Configuração da pilha
    PUSH    BP
    MOV     BP, SP

    MOV     AX, WORD [BP + 8]
    MOV     CX, WORD [BP + 6]

    MOV     BX, WORD [BP + 4]

    ADD     AX, CX

    MOV          [BX], AX    ; Lower bytes
    MOV     WORD [BX + 2], 0 ; Upper bytes - always zero, as we are using WORDs

    POP     BP
    RET     6

