INCLUDE "EMU8086.INC"
.MODEL SMALL
.STACK 100H
.DATA   
  NUM DW 0
.CODE 
MAIN PROC FAR
   MOV AX,@DATA
   MOV DS,AX
   
   NUMENTER:
   
       MOV AH,1
       INT 21H
       CALL CHECK
       CMP AL,13
       JZ PROG
       CMP AL,20
       JE TERMINATE
       
       SUB AL,48
       MOV BX,0
       MOV BL,AL
       MOV AL,10
       
       MUL NUM
        
       ADD AX,BX
       MOV NUM,AX
       JMP NUMENTER 
    
   
   PROG:
    CALL NEWLINE
    MOV AX,NUM
    CALL PRINTNUM
    MOV DX,0
    MOV AX,NUM
    MOV BX,2
    DIV BX
    CMP DX,0
    JE PYES
    CMP DX,0
    JNE PNO
    
   PYES:
    CALL NEWLINE
    PRINT "IS EVEN"
    JMP TERMINATE
   PNO: 
   CALL NEWLINE
    PRINT "IS ODD"
    JMP TERMINATE
   TERMINATE:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
    

PRINTNUM PROC
   MOV DX,0
   MOV CX,0 
   LABEL:
   CMP AX,0
   JE PRINT1
   
   MOV BX,10
   
   DIV BX
   
   PUSH DX 
   
   INC CX
   
   XOR DX,DX
   JMP LABEL
   
   PRINT1:
   CMP CX,0
   
   JE EXIT
   
   POP DX
   ADD DX,48
   
   MOV AH,2
   INT 21H
   
   DEC CX
   JMP PRINT1  
   
   EXIT:
   RET
   PRINTNUM ENDP  

 
   CHECK PROC
    NORMAL:
        CMP AL,13
        JE END
        CMP AL,48
        JL ENDALL
        CMP AL,57
        JG ENDALL
        JMP END
    ENDALL:
        CALL NEWLINE
        PRINT "PLEASE ENTER A VALID NUMBER"
        MOV AL,20  
    END:
        RET
    CHECK ENDP
   
   
PROC NEWLINE
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV AH,2
    MOV DL,13
    INT 21H
    RET
 NEWLINE ENDP    
   
   
END MAIN