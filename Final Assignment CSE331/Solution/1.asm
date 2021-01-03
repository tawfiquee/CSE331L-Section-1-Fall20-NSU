
.MODEL SMALL
.STACK 100H


.DATA

MSG1 DB "Lowercase Character:$"
MSG2 DB 0DH,0AH, "Uppercase Character : $"


.CODE

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    LEA DX, MSG1 
    MOV AH, 9
    INT 21H
    
    MOV AH, 1 
    INT 21H
    
    MOV BL, AL  
    
    SUB BL,20H
    
    LEA DX, MSG2 
    MOV AH, 9
    INT 21H
    
    MOV AH, 2 
    MOV DL, BL
    INT 21H
    
    
    @EXIT:     
    MOV AH, 4CH
    INT 21H
    
MAIN ENDP
END MAIN
