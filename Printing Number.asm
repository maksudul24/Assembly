.MODEL SMALL
.STACK 100H
.DATA   
  NUM DW 365
.CODE 
MAIN PROC FAR
   MOV AX,@DATA
   MOV DS,AX
   
   MOV AX,NUM
   
   CALL PRINT
   
   MOV AH,4CH
   INT 21H
MAIN ENDP

PRINT PROC
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
   PRINT ENDP
END MAIN
   
 