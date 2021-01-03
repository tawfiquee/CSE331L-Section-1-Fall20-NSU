                                                                                          
.MODEL SMALL
.STACK 100H

OUTPUT MACRO MSG
    LEA DX,MSG
    MOV AH,9
    INT 21H
ENDM  

INPUT MACRO 
    MOV AH,1
    INT 21H
ENDM

.DATA 

STRING1 DB ? 
REVERSED    DB ?
      
MSG1    DB  13, 10, "First Digit:$"   
MSG2    DB  13, 10, "Second Digit:$"
NLINE   DB  13,10,"$"

.CODE
        
 MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    OUTPUT MSG1 
    
    INPUT
    
    MOV BL,AL 
    
    SUB BL,30H
    
    OUTPUT MSG2
    
    INPUT  
    
    SUB AL,30H
    
    MUL BL
    
    CMP AX,000FH
    JBE @ZERO
    
    
    @ONE: 
    OUTPUT NLINE
    MOV DX,0031H
    MOV AH,2
    INT 21H 
    JMP @EXIT
     
                                                     
    @ZERO: 
    OUTPUT NLINE
    MOV DX,0030H
    MOV AH,2
    INT 21H
     
  

    @EXIT:
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
    END MAIN
