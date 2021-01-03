
.MODEL SMALL
.STACK 100H

PRINT MACRO MSG
    LEA DX,MSG
    MOV AH,9
    INT 21H
ENDM  

READ MACRO 
    MOV AH,1
    INT 21H
ENDM

.DATA

MSG1 DB 13,10,"Enter Digit:$"
MSG2 DB 13,10,"This number is odd$"  
MSG3 DB 13,10,"This number is even$" 

.CODE

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    PRINT MSG1
    
    READ 
    
    SUB AL,30H     
    
    TEST AL,01H     
   
    JNE ODD
    
    EVEN:
    PRINT MSG3
    JMP @EXIT
    
    ODD:
    PRINT MSG2
    
    
    @EXIT:     
    MOV AH, 4CH   
    INT 21H
    
MAIN ENDP
END MAIN
