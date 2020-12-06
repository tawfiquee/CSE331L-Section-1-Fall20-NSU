.MODEL SMALL
 .STACK 100H

 .DATA
    PROMPT  DB  "Digits: $"

 .CODE
   MAIN PROC
     MOV AX, @DATA                ; initialize DS 
     MOV DS, AX

     LEA DX, PROMPT                
     MOV AH, 9
     INT 21H

     MOV CX, 10                   

     MOV AH, 2                      
     MOV DL, 48                   

     @LOOP:                       
       INT 21H                    

       INC DL                     
       DEC CX                     
     JNZ @LOOP                    

     MOV AH, 4CH                  
     INT 21H
   MAIN ENDP
 END MAIN
