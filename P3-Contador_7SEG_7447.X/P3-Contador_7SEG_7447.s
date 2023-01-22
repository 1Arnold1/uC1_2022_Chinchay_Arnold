PROCESSOR 18F57Q84
#include "Bit_config.inc"  /config statements should precede project file includes./
#include <xc.inc>
     
;--------------------------------------------------------------------------------
; @file:    P3-Contador_7SEG_7447.s
; @brief:   Contador 0-99 con display y un 7447 asc/desc dependiendo del pulsador
; @date:    15/01/2022
; @author:  Arnold Antonio Chinchay Saguma
;-------------------------------------------------------------------------------- 
    
PSECT udata_acs
 contador1: DS 1
 contador2: DS 1

PSECT resetVect,class=CODE,reloc=2
resetVect:
    goto Main 
    
PSECT CODE 
    
Main:
    CALL	Config_OSC,1
    CALL	Config_Port,1
    MOVLW	10011001B	    ; Cargamos 0x99 a w
    MOVWF	0X508		    ; Lo guadamos en la dirección 0x508
    
Loop:
    CALL	Delay_1s
    BTFSC	PORTA,3,0	    ; PORTA<3> = 0? - Button press?
    GOTO	C0		    
    GOTO	C99
;0-9
C0:
    MOVLW	0x00		    ; 0x00 a w
    MOVWF	PORTB		    ; Mostramos 0 en display
    MOVWF	0x504		    ; Guardamos 0 en 0x504
    CALL	Delay_1s,0	    ; Delay
    GOTO	button		    ; Verificamos botón
    
C99:
    MOVLW	0x99		    ; 0x99 a w
    MOVWF	PORTB		    ; Mostramos 99 en display
    MOVWF	0x504		    ; Guardamos 99 en 0x504
    CALL	Delay_1s,0	    ; Delay
    GOTO	button		    ; Verificamos botón
    
button:
    BTFSC	PORTA,3,0	    ; PORTA<3> = 0? - Button press?
    goto	ANALISIS_SUMA
    goto	ANALISIS_RESTA
    
SUMA:
    MOVLW	0001B		    ; 1 a w
    ADDWF	0x504,0,0	    ; Sumanos 1 al ultimo valor de la suma 
    BANKSEL	PORTB
    MOVWF	PORTB,1		    ; Mostramos en display
    MOVWF	0x504		    ; Guardamos en 0x504
    CALL	Delay_1s,0	     
    GOTO	button		
    
SUMA2:
    MOVLW	0x07		    ; 7 a w
    ADDWF	0x504,0,0	    ; Suma 9 + 7 para obtener 10
    MOVWF	PORTB		    ; Mostramos en display
    MOVWF	0x504		    ; Guardamos en 0x504
    CALL	Delay_1s,0
    GOTO	button    
    
ANALISIS_SUMA:
    MOVF	0x504,0		    ; Ultimo resultado a w
    CPFSEQ	0x508		    ; Si w = 99 skip
    GOTO	S9
    GOTO	button
    
S9:    
    BTFSC	0X504,3		    ; Skip si bit 3 = 0
    BTFSS	0X504,0		    ; Skip si bit 0 = 1
    GOTO	SUMA
    GOTO	SUMA2
    
RESTA:
    MOVLW	0001B		    ; 1 a w
    MOVWF	0x505		    ; 1 a 0x505
    SUBWF	0x504,0,0	    ; Resta 1 de 0x504
    MOVWF	PORTB		    ; Mostramos en display
    MOVWF	0x504		    ; Guardamos en 0x504
    CALL	Delay_1s,0
    GOTO	button
    
RESTA2:
    MOVLW	0x07		    ; 7 a w
    MOVWF	0x505		    ; 7 a 0x505
    SUBWF	0x504,0,0	    ; Resta 7 de 0x504
    MOVWF	PORTB		    ; Mostramos en display
    MOVWF	0x504		    ; Guardamos en 0x504
    CALL	Delay_1s,0
    GOTO	button    
    
ANALISIS_RESTA:
    MOVF	0x504,0		    ; Ultimo resultado a w
    MOVWF	0X510		    ; Ultimo resultado a 0x510
    TSTFSZ	0X510		    ; Si 0x510 = 0 skip
    GOTO	R9
    goto	button
    
R9:    
    BTFSS	0X504,3		    ; Skip si bit 3 = 1
    BTFSC	0X504,0		    ; Skip si bit 0 = 0
    goto	RESTA
    goto	ANALISIS_RESTA2
    
ANALISIS_RESTA2:
    BTFSS	0X504,2		    ; Skip si bit 2 = 1
    BTFSC	0X504,1		    ; Skip si bit 1 = 0
    goto	RESTA
    goto	RESTA2
    
Config_OSC:
    ;Configuracion del oscilador interno a una frecuencia de 4MHz
    BANKSEL	OSCCON1 
    MOVLW	0x60        ;Seleccionamos el bloque del osc con un div:1
    MOVWF	OSCCON1
    MOVLW	0x02        ; Seleccionamos una frecuencia de 4MHz
    MOVWF	OSCFRQ 
    RETURN
   
Config_Port:  ;PORT-LAT-ANSEL-TRIS	    LED:RF3	BUTTON:RA3
    ;Config Led
    BANKSEL	PORTB
    CLRF	PORTB,1	; PORTF = 0 
    BSF		LATB,7,1
    CLRF	ANSELB,1	; ANSELF<7:0> = 0 -PORT F DIGITAL
    CLRF	TRISB	; RB<7-0> como salida

    ;Config Button
    BANKSEL	PORTA
    CLRF	PORTA,1	; PORTA<7:0> = 0
    CLRF	ANSELA,1	; PortA digital
    BSF		TRISA,3,1	; RA3 como entrada
    BSF		WPUA,3,1	; Activamos la resistencia Pull-Up del pin RA3
    RETURN 
    
Delay_1s:
;    Call	Delay_250ms
    Call	Delay_250ms
    Call	Delay_250ms
    Call	Delay_250ms
Delay_250ms:		    ;2Tcy -- Call
    MOVLW	250		    ;1Tcy
    MOVWF	contador2,0	    ;1Tcy
 

Ext_Loop_250ms:
    MOVLW	248		    ;n*TcyTcy
    MOVWF	contador1,0	    ;n*Tcy
    
Int_Loop_250ms:
    NOP				    ;k*Tcy
    DECFSZ	contador1,1,0	    ;((k-1) + 3)*n*Tcy
    GOTO	Int_Loop_250ms	    ;(k-1)*2*n*Tcy
    NOP				    ;n*Tcy
    NOP				    ;n*Tcy
    NOP				    ;n*Tcy
    DECFSZ	contador2,1,0	    ;(n-1) + 3Tcy
    GOTO	Ext_Loop_250ms	    ;(n-1)*2Tcy
    RETURN			    ;2Tcy
     
END resetVect

