.MODEL SMALL
.STACK 100H

.DATA

    MSG1 DB 'AL value: $'
    MSG2 DB 0DH,0AH,'New AL value: $'

.CODE
    MAIN PROC
     MOV AX, @DATA                
     MOV DS, AX

     LEA DX, MSG1             
     MOV AH, 9
     INT 21H

     MOV AL, 32H                  
     MOV BL, AL                       

     MOV AH, 2                    
     MOV DL, AL
     INT 21H

     LEA DX, MSG2             
     MOV AH, 9
     INT 21H

     AND BL, 0FH                   

     MOV CL, 2                    
     SHL BL, CL

     OR BL, 30H                   

     MOV AH, 2                    
     MOV DL, BL
     INT 21H

     MOV AH, 4CH                  
     INT 21H
   MAIN ENDP 
 END MAIN