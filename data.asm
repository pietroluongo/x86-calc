SEGMENT DATA
CR      EQU     0Dh
LF      EQU     0Ah
NULL    EQU     00h
MSG     DB      'Hello World Calculator', CR, LF, '$'
RESULT  DB      NULL, NULL, NULL, NULL      ; 4 bytes