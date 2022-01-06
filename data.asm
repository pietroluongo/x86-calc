SEGMENT DATA
CR      EQU     0Dh
LF      EQU     0Ah
NULL    EQU     00h
MSG     DB      'Hello World Calculator', CR, LF, '$'
RESULT  DB      NULL, NULL, NULL, NULL      ; 4 bytes
; 0x0 = ADD
; 0x1 = SUB
; 0x2 = MUL
; 0x3 = DIV
OP_ADD   EQU    0x0
OP_SUB   EQU    0x1
OP_MUL   EQU    0x2
OP_DIV   EQU    0x3
LAST_OP  DB     NULL ; 1 byte, last operation done by the calculator

WELCOME_MSG DB  "############################################################", CR, LF, "Welcome to the calculator", CR, LF, "############################################################", CR, LF, NULL