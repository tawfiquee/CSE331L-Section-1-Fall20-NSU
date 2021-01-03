.MODEL SMALL
.STACK 100H
.DATA 
A DB 'First Integer: $'
B DB 0DH,0AH,'Second Integer: $'
S DB 0DH,0AH,'LCM : $'  

GCD DW ?
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,A
    MOV AH,9
    INT 21H
    
INPUT_1:
    MOV AH,1      
    INT 21H
    MOV CL,AL
    
    LEA DX,B
    MOV AH,9
    INT 21H 
    
INPUT_2:
    MOV AH,1
    INT 21H
    
    MOV BL,AL 
    

    CMP CL,BL
    JB EXCHANGE
     
    

      
L4: MOV AL,CL
    MOV CL,1  
    SUB AL,30H
    SUB BL,30H

LCM:
   MOV BH,AL                          
   MUL CL                    
   AAM
   MOV DX,AX        
   DIV BL           
   CMP AH,00
   JZ RESULT_PRINT        
   INC CL           
   MOV AL,BH
   JMP LCM
   
RESULT_PRINT:
   MOV CX,DX
   
   LEA DX,S
   MOV AH,9
   INT 21H
   
   MOV DX,CX
   ADD DX,30H
   MOV AH,2
   INT 21H
   JMP EXIT   
EXCHANGE:
      XCHG CL,BL
      JMP L4            
  
EXIT: 
  MOV AH,4CH
  INT 21H
MAIN ENDP
END MAIN
     