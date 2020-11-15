            
            
            
            
org 100h ;starting add -0000, ending -FFFF; prog start, assembler, return
         ; 02 ---02H;
         
            ; int main(){
MOV AX, 02
MOV BX, 02 
MOV CX, 02
ADD AX, BX, CX 
            ; AX=AX+BX+CX        ;  int a=2, b=2, c=2, d=0;        
            ;  d = a+b+c; 
            ;  printf(d);
            ;  return 0;    
            ;
ret     

               