                                                                                          
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
      
MSG1    DB  13, 10, "Enter a string: $"   
MSG2    DB  13, 10, "Total number of vowels in the string: $"     

.CODE
        
 MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    OUTPUT MSG1 
    
    MOV CL,0H   
    
    INPUT 
    MOV BL,AL  
                                                           
   @READ:            
    CMP BL, 13
    JE @PRINT
   
    CMP BL,'A'
    JE increase      
    CMP BL, 'E'
    JE increase
    CMP BL, 'I'
    JE increase 
    CMP BL, 'O'
    JE increase
    CMP BL, 'U'
    JE increase  
    CMP BL,'a'
    JE increase      
    CMP BL, 'e'
    JE increase
    CMP BL, 'i'
    JE increase 
    CMP BL, 'o'
    JE increase
    CMP BL, 'u'
    JE increase
    
    INPUT
    MOV BL,AL
    JMP @READ
    
    increase:
    INC CL 
    INPUT  
    MOV BL,AL
    JMP @READ
    
    
    @PRINT:  
    OUTPUT MSG2   
    ADD CL,30H
    MOV DL,CL  
    MOV AH,2 
    INT 21H
       
    @EXIT:  
    MOV AH, 4CH
    INT 21H

 
    MAIN ENDP
    END MAIN
