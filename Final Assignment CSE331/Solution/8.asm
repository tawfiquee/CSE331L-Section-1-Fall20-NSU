.MODEL SMALL
.STACK 100H

.DATA 

MSG1 DB 'Enter a string: $'
S DB 50 DUP('$')
SR DB 50 DUP('$')
MSG2 DB 0dh,0ah,'Your string: $'
MSG3 DB 0dh,0ah,'Your string in backward: $'
MSG4 DB 0dh,0ah,'This is palindrome$'
MSG5 DB 0dh,0ah,'This is not Palindrome$'

.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H
    
    LEA SI, S 
    LEA DI, SR
    
    
STRING_INPUT:
    MOV AH,1
    INT 21H
    CMP AL,13
    JE  PRINT_STRING
    MOV [SI],AL
    INC SI
    LOOP STRING_INPUT

PRINT_STRING:
    LEA DX,MSG2
    MOV AH,9
    INT 21H
    
    MOV DL,OFFSET S
    MOV AH,9
    INT 21H  
    
    
    lEA DX,MSG3
    MOV AH,9
    INT 21H
    
    DEC SI 
REVERSE_STRING:
  
    
    MOV AL,[SI]
    MOV [DI],AL
    INC DI 
    DEC SI
    CMP [SI],'$'
    JNZ REVERSE_STRING
    MOV AL,'$'
    MOV [DI],AL 
   
    MOV DL,OFFSET SR
    MOV AH,9
    INT 21H 
    
    LEA SI,S
    LEA DI,SR

PALINDROME:
    MOV AL,[SI]
    CMP AL,'$'
    JZ P_PALIN
    MOV BL,[DI]
    CMP AL,BL
    JNZ N_PALIN
    INC DI
    INC SI
    JMP PALINDROME
       

P_PALIN:
    LEA DX,MSG4
    MOV AH,9
    INT 21H
    JMP EXIT

N_PALIN:
    LEA DX,MSG5
    MOV AH,9
    INT 21H
    JMP EXIT    
    
EXIT:    
    MOV AH,4CH
    INT 21H
        
MAIN ENDP
END MAIN