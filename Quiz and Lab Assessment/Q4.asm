.MODEL SMALL
.STACK 100H

.DATA
      
MSG1    DB  13, 10, "Enter a HEX digit (0-9 & A-F): $"   
MSG2    DB  13, 10, "Decimal : $"  
MSG3    DB  13, 10, "Invalid Character $"   

.CODE
        
 MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    LEA DX, MSG1
    MOV AH, 9
    INT 21H
            
    MOV AH, 1
    INT 21H  
   
    MOV BL,AL 
    
    CMP BL,9
    JA FirstDigit  
    
    LEA DX, MSG2
    MOV AH, 9
    INT 21H 
    
   
    
    SecondDigit: 
    MOV DL, BL                   
    INT 21H 
    
    
    FirstDigit:  
    MOV AH, 2                    
    MOV DL, 1H   
    ADD DL, 30H
    INT 21H   
    SUB BL, 11H  
    JMP SecondDigit                

   
  
  
       
    @EXIT:  
    MOV AH, 4CH
    INT 21H

 
    MAIN ENDP
    END MAIN