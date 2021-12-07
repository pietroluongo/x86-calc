global _soma

; Função de soma de dois números
; retorno: EAX   WORD número resultante da soma
; arg0:    STACK WORD número 1
; arg1:    STACK WORD número 2
; arg2:    STACK WORD endereço de retorno
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