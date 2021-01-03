
.MODEL SMALL
.STACK 100H


.DATA

MSG1 DB 13,10,"Digit:$"
MSG2 DB 13,10,"Divide by 4 using SHR instruction:$"

.CODE

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    LEA DX, MSG1 
    MOV AH, 9
    INT 21H
    
    MOV AH, 1 
    INT 21H   
    
    SUB AL,30H     
    
    MOV CL,2       
    
    SHR AL,CL 
    
    MOV BL,AL
    
    LEA DX, MSG2 
    MOV AH, 9
    INT 21H   
    
    ADD BL,30H        
    
    MOV AH, 2 
    MOV DL, BL
    INT 21H
    
    
    @EXIT:     
    MOV AH, 4CH  
    INT 21H
    
MAIN ENDP
END MAIN
