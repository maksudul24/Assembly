.model small
.stack 100H 
.DATA
    MSG DB "HI THIS IS RABAT"
.code
main proc
    MOV AH,1
    INT 21H
    MOV BH,AL
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV AH,2
    MOV DL,13
    INT 21H
    
             
    MOV AH,2
    MOV DL,BL
    INT 21H 
    
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV AH,2
    MOV DL,13
    INT 21H
    
            
    MOV AH,2
    MOV DL,BH
    INT 21H
      
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN