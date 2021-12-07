global _soma

; Função de soma de dois números
; retorno: EAX   WORD número resultante da soma
; arg0:    STACK WORD número 1
; arg1:    STACK WORD número 2
_soma:
    ; Configuração da pilha
    PUSH    BP
    MOV     BP, SP

    MOV     AX, WORD [BP + 4]
    MOV     BX, WORD [BP + 6]

    ADD     AX, BX

    POP     BP
    RET     4