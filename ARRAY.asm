.MODEL SMALL
.STACK 100H
.DATA 
   MSG DB "I LOVE YOU $"
   ARA DB 10 DUB (?)    
.CODE 
MAIN PROC FAR
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSG
    MOV AH,9
    INT 21H
    
    MOV DL,10
    MOV AH,2
    INT 21H
    MOV DL,13 
    MOV AH,2
    INT 21H
    
    
    MOV CX,10
    MOV SI,0 
    CALL SCAN
    
    MOV CX,10 
    MOV SI,0
    
    CALL PRINT
    
    MOV AH,4CH
    INT 21H  
    MAIN ENDP 
SCAN PROC 
    
    
    LOOP1:
        CMP CX,0
        JE EXIT1
        
        MOV AH,1 
        INT 21H
        
        MOV ARA[SI],AL
        
        ADD SI,1
        
        DEC CX 
        JMP LOOP1
        
    EXIT1:
        MOV DL,10
        MOV AH,2
        INT 21H
        MOV DL,13
        MOV AH,2
        INT 21H
        RET
        SCAN ENDP   
    
PRINT PROC
    
    LOOP2:
        CMP CX,0
        JE EXIT2
        
        MOV DL,ARA[SI]
        ADD SI,1
        
        MOV AH,2
        INT 21H
        
 
        DEC CX
        JMP LOOP2
       
    
    EXIT2:
        MOV AH,2
        MOV DL,10
        INT 21H
        MOV AH,2
        MOV DL,13
        INT 21H
        RET
        PRINT ENDP
END MAIN
         
    
   
    
    