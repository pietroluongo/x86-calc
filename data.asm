SEGMENT DATA
CR            EQU     0Dh
LF            EQU     0Ah
NULL          EQU     00h
MSG           DB      'Hello World Calculator', CR, LF, '$'
CLEAR_LINE    DB      CR, LF, '$'
; 0x0 = ADD
; 0x1 = SUB
; 0x2 = MUL
; 0x3 = DIV
OP_ADD   EQU    0x0
OP_SUB   EQU    0x1
OP_MUL   EQU    0x2
OP_DIV   EQU    0x3
LAST_OP  DB     NULL ; 1 byte, last operation done by the calculator


; Input stuff
USR_INPUT_MAX_SIZE      DB    6
USR_INPUT_ACTUAL_SIZE   DB    0
USR_INPUT_BUFFER        DB    "000000"
RESULT_ASCII            DB    "999999"

; Actual math stuff
SELECTED_OP    DB    0xFF
FST_OP         DW    0xFF
SND_OP         DW    0xFF
RESULT         DW    0x00