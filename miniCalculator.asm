.MODEL SMALL
.STACK 100H
.DATA

;                    ***Mini Calculator*** 
Msg00  DB "+--------------------------------------+$"
Msg0   DB "|    Mini Assembly Calculator v1.0     |$"
Msg000 DB "+--------------------------------------+$"

    
Msg1 DB ":      [1]  Addition                   ;$" 
Msg2 DB ":      [2]  Subtract                   ;$"
Msg3 DB ":      [3]  Multiply                   ;$"
Msg4 DB ":      [4]  Divide                     ;$"

Msg5 DB "Enter two numbers for Addition: $"
Msg6 DB "Enter two numbers for Subtraction: $"
Msg7 DB "Enter two numbers for Multiplication: $"
Msg8 DB "Enter two numbers for Division: $"
 
Msg9 DB "|          Choose an option            |$" 

Msg10 DB "RESULT (Decimal)      : $"
Msg11 DB "Thank You for Using Our Assembly Calculator! $" 
Msg12 DB "Please Enter an Valid option : $"
Msg13 DB "RESULT (Binary)       : $" 
Msg14 DB "RESULT (Hexadecimal)  : $" 
Msg15 DB "Remainder             : $"
Msg16 DB "Just type 1 to perform another calculation $"  

Msg17 DB "To EXIT,type : 2 $"
Msg18 DB "Error 404!  $"


.CODE
MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,Msg00
    MOV AH,9
    INT 21H 
    
    call NL
    
    LEA DX,Msg0
    MOV AH,9
    INT 21H
    
    call NL
     
    LEA DX,Msg000
    MOV AH,9
    INT 21H
    
    call NL
             
    START:
    
    call NL
    
    LEA DX,Msg1
    MOV AH,9
    INT 21H
    
    CALL NL
    
    LEA DX,Msg2
    MOV AH,9
    INT 21H
    
    CALL NL
    
    LEA DX,Msg3
    MOV AH,9
    INT 21H
    
    CALL NL
    
    LEA DX,Msg4
    MOV AH,9
    INT 21H
    
    CALL NL
    call NL
    
    LEA DX,Msg00
    MOV AH,9
    INT 21H 
    
    call NL
    
    LEA DX,Msg9
    MOV AH,9
    INT 21H  
    
    call NL
    
    LEA DX,Msg000
    MOV AH,9
    INT 21H 
    
    call NL
    
    CALC:
    MOV AH,1
    INT 21H
    MOV BL,AL  
    
    CALL NL
    CALL NL
    
    
    CMP BL,'1'
    JE ADDD
    
    CMP BL,'2'
    JE SUBB
    
    CMP BL,'3'
    JE MULL
    
    CMP BL,'4'
    JE DIVV
    
    LEA DX,Msg12
    MOV AH,9
    INT 21H
    
    JMP CALC
 
    
    ADDD:
    
    LEA DX,Msg5
    MOV AH,9
    INT 21H 
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    MOV AH,2
    MOV DL,'+'
    INT 21H
           
    MOV AH,1       
    INT 21H 
    MOV CL,AL
    
    ADD BL,CL
    MOV BH,BL
    SUB BL,48
    CMP BL,'9'
    JG I
    
    CALL NL
    CALL NL
    
    CALL DR
    
          
    MOV AH,2
    MOV DL,BL
    INT 21H
        
    

        
    CALL NL
    CALL HR
    
    CALL NL
    CALL BR  
    
    CALL NL
    CALL NL
    
    LEA DX,Msg16
    MOV AH,9
    INT 21H
    CALL NL 
    
    LEA DX,Msg17
    MOV AH,9
    INT 21H
    CALL NL 
    
    LEA DX,Msg9
    MOV AH,9
    INT 21H
    MOV AH,1
    INT 21H 
    
    MOV BL,AL
    CMP BL,'1' 
    
    JE START
    
    CALL NL
    CALL NL
    
    CALL TNX
    
    CALL DISPLAY_GREEN_RESULT
    
    JMP EXIT
    
    SUBB:
    
    LEA DX,Msg6
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    MOV AH,2
    MOV DL,'-'
    INT 21H
    
    MOV AH,1
    INT 21H 
    MOV CL,AL
    CMP BL,CL
    JL J 
    
    
    
    SUB BL,CL
    CMP BL,'9'
    JG J 
    ADD BL,48
    
    CALL NL
    CALL NL 
    
    CALL DR
    
    MOV AH,2
    MOV DL,BL
    INT 21H
    
    CALL NL
    CALL HR
    
    CALL NL
    CALL BR 
    
    CALL NL  
    CALL NL
    
    LEA DX,Msg16
    MOV AH,9
    INT 21H
    CALL NL 
    
    LEA DX,Msg17
    MOV AH,9
    INT 21H
    CALL NL 
    
    LEA DX,Msg9
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H 
    
    MOV BL,AL
    CMP BL,'1' 
    
    JE START
    
    CALL NL
    CALL NL
    
    CALL TNX
     
    JMP EXIT
    
    MULL:
    LEA DX,Msg7
    MOV AH,9
    INT 21H
    
        MOV AX,0
        MOV BX,0
        MOV CX,0
        MOV DX,0
    
    MOV AH,1
    INT 21H
    SUB AL,48
    MOV CL,AL
    MOV CH,0
    
    MOV AH,2
    MOV DL,'*'
    INT 21H
    
    MOV AH,1
    INT 21H
    SUB AL,48
    MOV BL,AL
    MOV BH,0
    
    MOV AX,CX 
    
    MUL BX
    MOV CX,AX
    ADD CL,48
    CMP CL,'9'
    JG K 
    
    CALL NL
    CALL NL
    CALL DR
    
    MOV AH,2
    MOV DL,CL
    INT 21H
    MOV BL,CL
    
    CALL NL
    CALL HR
    
    CALL NL
    CALL BR  
    
    CALL NL
    CALL NL
    
    LEA DX,Msg16
    MOV AH,9
    INT 21H
    CALL NL
    
    LEA DX,Msg17
    MOV AH,9
    INT 21H
    CALL NL  
    
    LEA DX,Msg9
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H 
    
    MOV BL,AL
    CMP BL,'1' 
    
    JE START
    
    CALL NL
    CALL NL
    
    CALL TNX
    
    JMP EXIT
    
    DIVV:
    
    LEA DX,Msg8
    MOV AH,9
    INT 21H
    
        MOV AX,0
        MOV BX,0
        MOV CX,0
        MOV DX,0
    
    MOV AH,1
    INT 21H
    SUB AL,48
    MOV CL,AL
    
    
    MOV AH,2
    MOV DL,'/'
    INT 21H
    
    MOV AH,1
    INT 21H 
    
    SUB AL,48
    CMP AL,0
    JE L
    MOV BL,AL
    
    CMP CL,BL
    JL L
    
    
    MOV AX,CX 
    
    DIV BL
    MOV CX,AX
    ADD CL,48
     
    
    CALL NL
    CALL NL 
    
    CALL DR
    
    
    MOV AH,2
    MOV DL,CL
    INT 21H
    MOV BL,CL
    
    call NL
    
    LEA DX,Msg15
    MOV AH,9
    INT 21H
    
    MOV CL,CH    
    ADD CL,48
    MOV BH,CL
    MOV AH,2
    MOV DL,CL
    INT 21H
    
    CALL NL
    CALL HR
    call NL
    
    LEA DX,Msg15
    MOV AH,9
    INT 21H
    
    MOV AH,2
    MOV DL,'3'
    INT 21H
    MOV DL,BH
    INT 21H
    MOV DL,'h'
    INT 21H
    
    
    CALL NL
    CALL BR
    call NL
    
    LEA DX,Msg15
    MOV AH,9
    INT 21H
    
    ADD BL,BH
    CALL BR1 
    
    
    CALL NL 
    CALL NL 
    
    LEA DX,Msg16
    MOV AH,9
    INT 21H
    CALL NL 
    
    LEA DX,Msg17
    MOV AH,9
    INT 21H
    CALL NL
    
    LEA DX,Msg9
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H 
    
    MOV BL,AL
    CMP BL,'1'
    JE START
    
    CALL NL
    CALL NL
    
    CALL TNX
    
    JMP EXIT 
    
    NL:
    MOV AH,2
    MOV DL,13
    INT 21H
    MOV DL,10
    INT 21H
    RET
    
    TNX:    
    LEA DX,Msg11
    MOV AH,9
    INT 21H
    RET 
    
    DR:     
    LEA DX,Msg10
    MOV AH,9
    INT 21H
    
    RET 
    
    BR:    
    LEA DX,Msg13
    MOV AH,9
    INT 21H 
    SUB BL,48
    
    MOV CX,8
    
    TOP:
    SHL BL,1
    JC ONE 
    
    MOV AH,2
    MOV DL,'0'
    INT 21H
    
    LOOP TOP
    JMP NEXT
    
    ONE:
    MOV AH,2
    MOV DL,'1'
    INT 21H
    
    LOOP TOP
    
    NEXT:
    
    RET
    
    HR: 
    LEA DX,Msg14
    MOV AH,9
    INT 21H
    
    MOV AH,2
    MOV DL,'3'
    INT 21H
    MOV DL,BL
    INT 21H
    MOV DL,'h'
    INT 21H
    
    
    RET 
    
    BR1:
    SUB BL,48    
    MOV CX,8 
    
    TOP1:
    SHL BL,1
    JC ONE1     
    MOV AH,2
    MOV DL,'0'
    INT 21H
    
    LOOP TOP1
    JMP NEXT1
    
    ONE1:
    MOV AH,2
    MOV DL,'1'
    INT 21H
    
    LOOP TOP1
    
    NEXT1:
    
    RET 
    
    I: 
    CALL NL
    CALL NL
    
    LEA DX,Msg18
    MOV AH,9
    INT 21H 
    CALL NL
    
    JMP ADDD
    
    J: 
    CALL NL
    CALL NL
    
    LEA DX,Msg18
    MOV AH,9
    INT 21H
    CALL NL
    
    JMP SUBB
    
    K: 
    CALL NL
    CALL NL
    
    LEA DX,Msg18
    MOV AH,9
    INT 21H 
    CALL NL
    
    JMP MULL
    
    L: 
    CALL NL
    CALL NL
    
    LEA DX,Msg18
    MOV AH,9
    INT 21H
    CALL NL
    
    JMP DIVV
    
    
    DISPLAY_GREEN_RESULT:
    PUSH AX    ; <-- SAVE AX (includes AH, the DOS function number)
    PUSH CX    ; Save CX, as INT 10H uses it

    MOV AH,09H ; Function: Write Character and Attribute
    MOV AL, BL ; Character to write (BL holds the result character)
    MOV BL, 0AH ; Attribute: Foreground Green
    MOV CX, 1   ; Count: Write the character once
    INT 10H

    POP CX     ; Restore CX
    POP AX     ; <-- RESTORE AX
    RET

    DISPLAY_RED_RESULT:
    PUSH AX    
    PUSH CX    
    MOV AH,09H
    MOV AL, BL
    MOV BL, 0CH     ; Red color
    MOV CX, 1
    INT 10H
    RET

    DISPLAY_BLUE_RESULT:
    MOV AH,09H
    MOV AL, BL
    MOV BL, 09H     ; Blue color
    MOV CX, 1
    INT 10H
    RET
    
    DISPLAY_Magenta_RESULT:
    MOV AH,09H
    MOV AL, BL
    MOV BL, 0DH     ; Magenta color
    MOV CX, 1
    INT 10H
    RET
    
    EXIT:
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN           
