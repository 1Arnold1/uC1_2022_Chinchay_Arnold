PROCESSOR 18F57Q84

#include "BIT_config.inc"	// config statements should precede project file includes.
#include <xc.inc>
#include "Retardos.inc"
     
;--------------------------------------------------------------------------
; @file:    P2-Display_7SEG.s
; @brief:   Contador 0-9 y A-F dependiendo del estado del pulsador
; @date:    15/01/2022
; @author:  Arnold Antonio Chinchay Saguma
;--------------------------------------------------------------------------

PSECT resetVect,class=CODE,reloc=2
resetVect:
    goto Main
    
PSECT CODE
    
Main:
    CALL    Config_OSC,1
    CALL    Config_Port,1

Num0:
    MOVLW	11000000B
    MOVWF	PORTD,1
    CALL	Delay_250ms	;
    CALL	Delay_250ms	;
    CALL	Delay_250ms	;
    CALL	Delay_250ms	; 1 segundo de retraso
    BTFSC	PORTA,3,0	; PORTA <3> = 0  -  BUTTON PRESS
    GOTO	Num1	
    GOTO	Alfa
Num1:
    MOVLW	11111001B	; 
    MOVWF	PORTD,1		; Se sube el valor de 1 al puerto D
    CALL	Delay_250ms	;
    CALL	Delay_250ms	;
    CALL	Delay_250ms	;
    CALL	Delay_250ms	; 1 segundo de retraso
    BTFSC	PORTA,3,0	; PORTA <3> = 0  -  BUTTON PRESS
    GOTO	Num2	
    GOTO	Alfa
    
Num2:
    MOVLW	10100100B	; 
    MOVWF	PORTD,1		; Se sube el valor de 2 al puerto D
    CALL	Delay_250ms	;
    CALL	Delay_250ms	;
    CALL	Delay_250ms	;
    CALL	Delay_250ms	; 1 segundo de retraso
    BTFSC	PORTA,3,0	; PORTA <3> = 0  -  BUTTON PRESS
    GOTO	Num3
    GOTO	Alfa
Num3:
    MOVLW	10110000B	;
    MOVWF	PORTD,1		; Se sube el valor de 3 al puerto D
    CALL	Delay_250ms	;
    CALL	Delay_250ms	;
    CALL	Delay_250ms	;
    CALL	Delay_250ms	; 1 segundo de retraso
    BTFSC	PORTA,3,0	; PORTA <3> = 0  -  BUTTON PRESS
    GOTO	Num4
    GOTO	Alfa
    
Num4:
   
    MOVLW	10011001B	;
    MOVWF	PORTD,1		; Se sube el valor de 4 al puerto D
    CALL	Delay_250ms	; 
    CALL	Delay_250ms	;
    CALL	Delay_250ms	;
    CALL	Delay_250ms	; 1 segundo de retraso
    BTFSC	PORTA,3,0	; PORTA <3> = 0  -  BUTTON PRESS
    GOTO	Num5
   GOTO 	Alfa
Num5:
    MOVLW	10010010B	;
    MOVWF	PORTD,1		; Se sube el valor de 5 al puerto D
    CALL	Delay_250ms	;
    CALL	Delay_250ms	;
    CALL	Delay_250ms	;
    CALL	Delay_250ms	; 1 segundo de retraso
    BTFSC	PORTA,3,0	; PORTA <3> = 0  -  BUTTON PRESS
    GOTO	Num6
    GOTO	Alfa

Num6:
    MOVLW	10000010B	;
    MOVWF	PORTD,1		; Se sube el valor de 6 al puerto D
    CALL	Delay_250ms	;
    CALL	Delay_250ms	;
    CALL	Delay_250ms	;
    CALL	Delay_250ms	; 1 segundo de retraso
    BTFSC	PORTA,3,0	; PORTA <3> = 0  -  BUTTON PRESS
    GOTO	Num7
    GOTO	Alfa
    
Num7:
    MOVLW	11111000B	;
    MOVWF	PORTD,1		; Se sube el valor de 7 al puerto D
    CALL	Delay_250ms	;
    CALL	Delay_250ms	;
    CALL	Delay_250ms	;
    CALL	Delay_250ms	; 1 segundo de retraso
    BTFSC	PORTA,3,0	; PORTA <3> = 0  -  BUTTON PRESS
    GOTO	Num8
    GOTO	Alfa

Num8:
    MOVLW	10000000B	;
    MOVWF	PORTD,1		; Se sube el valor de 8 al puerto D
    CALL	Delay_250ms	;
    CALL	Delay_250ms	;
    CALL	Delay_250ms	;
    CALL	Delay_250ms	; 1 segundo de retraso
    BTFSC	PORTA,3,0	; PORTA <3> = 0  -  BUTTON PRESS
    GOTO	Num9
    GOTO	Alfa

Num9:
    MOVLW	10010000B	;
    MOVWF	PORTD,1		; Se sube el valor de 9 al puerto D
    CALL	Delay_250ms	;
    CALL	Delay_250ms	;
    CALL	Delay_250ms	;
    CALL	Delay_250ms	; 1 segundo de retraso
    BTFSC	PORTA,3,0	; PORTA <3> = 0  -  BUTTON PRESS
    GOTO	Num0
    GOTO	Alfa
    
Alfa:
    MOVLW	00001000B	;	
    MOVWF	PORTD,1		; Se sube el valor de A al puerto D
    CALL	Delay_250ms	;
    CALL	Delay_250ms	;
    CALL	Delay_250ms	;
    CALL	Delay_250ms	; 1 segundo de retraso
    BTFSC	PORTA,3,0	; PORTA <3> = 0  -  BUTTON PRESS
    GOTO	Num0
    GOTO	Alfb
    
    
Alfb:
    MOVLW	00000011B	;
    MOVWF	PORTD,1		; Se sube el valor de b al puerto D
    CALL	Delay_250ms	;
    CALL	Delay_250ms	;
    CALL	Delay_250ms	;
    CALL	Delay_250ms	; 1 segundo de retraso
    BTFSC	PORTA,3,0	; PORTA <3> = 0  -  BUTTON PRESS
    GOTO	Num0
    GOTO	Alfc


Alfc:
    MOVLW	01000110B	;
    MOVWF	PORTD,1		; Se sube el valor de C al puerto D
    CALL	Delay_250ms	;
    CALL	Delay_250ms	;
    CALL	Delay_250ms	;
    CALL	Delay_250ms	; 1 segundo de retraso
    BTFSC	PORTA,3,0	; PORTA <3> = 0  -  BUTTON PRESS
    GOTO	Num0
    GOTO	Alfd

    
Alfd:
    MOVLW	00100001B	;
    MOVWF	PORTD,1		; Se sube el valor de d al puerto D
    CALL	Delay_250ms	;
    CALL	Delay_250ms	;
    CALL	Delay_250ms	;
    CALL	Delay_250ms	; 1 Segundo de retraso
    BTFSC	PORTA,3,0	; PORTA <3> = 0  -  BUTTON PRESS
    GOTO	Num0
    GOTO	Alfe

    
Alfe:
    MOVLW	00000110B	;
    MOVWF	PORTD,1		; Se sube el valor de E al puerto D
    CALL	Delay_250ms	;
    CALL	Delay_250ms	;
    CALL	Delay_250ms	;
    CALL	Delay_250ms	; 1 Segundo de retraso
    BTFSC	PORTA,3,0       ;PORTA <3> = 0  -  BUTTON PRESS
    GOTO	Num0
    GOTO	Alff
 
    
Alff:
    BANKSEL	PORTD		
    SETF	LATD,1		; Se sube el valor de 
    MOVLW	00001110B
    MOVWF	PORTD,1
    CALL	Delay_250ms
    CALL	Delay_250ms
    CALL	Delay_250ms
    CALL	Delay_250ms
    BTFSC	PORTA,3,0   ;PORTA <3> = 0  -  BUTTON PRESS
    GOTO	Num0
    GOTO	Alfa


Config_OSC:
    ;configuración del oscilador interno a una frecuencia de 8MHz
    BANKSEL	OSCCON1
    MOVLW	0x60	    ;seleccionamos el bloque del oscilador interno con un div:1
    MOVWF	OSCCON1,1
    MOVLW	0x02	    ;seleccionamos una frecuencia de 8MHz
    MOVWF	OSCFRQ,1 
    RETURN

Config_Port:		    ; PORT-LAT-ANSEL-TRIS LED_RF3, BUTTON:RA3
    ;config PORTD
    BANKSEL	PORTD
    CLRF	PORTD,1	    ;PORTD = 0 
    CLRF	ANSELD,1    ;ANSELD<7:F> = 0 - PORT D DIGITAL	
    CLRF	TRISD	    ;Puerto D como salida

    
    ;config Button
    BANKSEL PORTA
    CLRF    PORTA,1	    ;PORTA<7:0> = 0 
    CLRF    ANSELA,1	    ;PORTA digital
    BSF	    TRISA,3,1	    ;RA3 como entrada
    BSF	    WPUA,3,1	    ;Activamos la resistencia pull-up del pin RA3
    RETURN
    
END resetVect


