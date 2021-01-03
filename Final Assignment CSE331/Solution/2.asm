.MODEL SMALL
.STACK 100H 
.DATA
MSG1 DB 'Alphabets: $'
MSG2 DB 0DH,0AH, 'Reveresed: $'
S DB 50 DUP('$')
RS DB 50 DUP('$')
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    
    LEA SI,S
    LEA DI,RS
     
    LEA DX,MSG1
    MOV AH,9
    INT 21H
    
    
INPUT: 
   MOV AH,1
   INT 21H
   CMP AL,13
   JZ  l3
   MOV [SI],AL
   INC SI
   LOOP INPUT
   
 l3:
   LEA DX,MSG2
   MOV AH,9
   INT 21H
    
   DEC SI
REVERSE:
   
   MOV AL,[SI]
   MOV [DI],AL
   DEC SI
   INC DI
   CMP [SI],'$'
   JNZ REVERSE
   MOV AL,'$'
   MOV [DI],AL
   

   
   MOV DL,OFFSET RS
   MOV AH,9
   INT 21H
   
EXIT: 
   MOV AH,4CH
   INT 21H
   
MAIN ENDP
END MAIN
   
   
             