.MODEL SMALL
.STACK 100H
.DATA
SR DB 40 DUP('?')
SZ DW ?
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    MOV ES,AX
    MOV AH,1
    MOV DI,0
    REPT:
        INT 21H
        CMP AL,0DH
        JZ SKIP
        MOV SR[DI],AL
        INC DI
        JMP REPT
    SKIP:
    MOV SR[DI],'$'
    
    MOV AH,2
    MOV DL,10
    INT 21H
    
    MOV CX,DI
    MOV SI,0
    TOP:
       MOV DI,SI
       STEP:
            INC DI
            CMP CX,DI
            JZ END1
            MOV BL,SR[SI]
            CMP BL,SR[DI]
            JS STEP
            MOV BL,SR[SI]
            XCHG BL,SR[DI]
            MOV SR[SI],BL
            JMP STEP
       END1:
       INC SI
       CMP CX,SI
    JNZ TOP    
    MOV AH,9
    LEA DX,SR
    INT 21H
MAIN ENDP
END MAIN

                                