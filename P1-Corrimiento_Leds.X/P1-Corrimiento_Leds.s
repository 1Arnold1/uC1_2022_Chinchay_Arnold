PROCESSOR 18F57Q84
#include "BIT_config.inc"  /config statements should precede project file includes./
#include <xc.inc>
#include "Retardos.inc"
     
;--------------------------------------------------------------------------
; @file:    P1-Corrimiento_Leds.s
; @brief:   Corrimiento de leds con retardos de acuerdo a si es par o impar
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

Off:
    CLRF    LATC	    ;LATC<7:0> = 0  - Leds apagados
    CLRF    LATE	    ;LATE<7:0> = 0  - Leds apagados
    BTFSC   PORTA,3,0	    ;PORTA<3> = 0? - BUTTON PRESS?
    GOTO    Off		    ;Loop
    GOTO    Corr_impar   
    
Loop:
    BTFSC   PORTA,3,0	    ;PORTA<3> = 0? - Button press?
    RETURN
    call    Delay_100ms
    goto    stop
    
stop:
    BTFSC   PORTA,3,0	    ;PORTA<3> = 0? - Button press?
    goto    stop	    ;Loop
    RETURN
 
Corr_impar:
    N_1:
    MOVLW   00000001B	    ; w = 00000001
    MOVWF   LATC	    ; LED ON
    MOVLW   00000001B	    ; w = 00000001
    MOVWF   LATE,1	    ; LED ON	
    Call    Loop
    CALL    Delay_250ms,1
   
    N_2:
    Call    Loop
    MOVLW   00000010B	    ; w = 00000010
    MOVWF   LATC	    ; LED ON   
    MOVLW   00000001B	    ; w = 00000001
    MOVWF   LATE,1	    ; LED ON
    Call    Loop
    CALL    Delay_250ms,1
    N_3:
    Call Loop
    MOVLW   00000100B	    ; w = 00000100
    MOVWF   LATC	    ; LED ON
    MOVLW   00000001B	    ; w = 00000001
    MOVWF   LATE,1	    ; LED ON
    Call    Loop
    CALL    Delay_250ms,1
    
    N_4:
    Call    Loop
    MOVLW   00001000B	    ; w = 00001000
    MOVWF   LATC	    ; LED ON
    MOVLW   00000001B	    ; w = 00000001
    MOVWF   LATE,1	    ; LED ON
    Call    Loop
    CALL   Delay_250ms,1
    N_5:
    Call    Loop
    MOVLW   00010000B	    ; w = 00010000
    MOVWF   LATC	    ; LED ON
    MOVLW   00000001B	    ; w = 00000001
    MOVWF   LATE,1	    ; LED ON
    Call    Loop
    CALL    Delay_250ms,1
    
    N_6:
    Call    Loop
    MOVLW   00100000B	    ; w = 00100000
    MOVWF   LATC	    ; LED ON
    MOVLW   00000001B	    ; w = 00000001
    MOVWF   LATE,1	    ; LED ON
    Call    Loop
    CALL    Delay_250ms,1
    
    N_7:
    Call    Loop
    MOVLW   01000000B	    ; w = 01000000
    MOVWF   LATC	    ; LED ON
    MOVLW   00000001B	    ; w = 00000001
    MOVWF   LATE,1	    ; LED ON
    Call    Loop
    CALL    Delay_250ms,1
    
    N_8:
    Call    Loop
    MOVLW   10000000B	    ; w = 10000000
    MOVWF   LATC	    ; LED ON
    MOVLW   00000001B	    ; w = 00000001
    MOVWF   LATE,1	    ; LED ON
    Call    Loop
    CALL    Delay_250ms,1
    Call    Loop
    goto    N1
    
Corr_par:
    N1:
    MOVLW   00000001B	    ; w = 00000001
    MOVWF   LATC	    ; LED ON
    MOVLW   00000010B	    ; w = 00000010
    MOVWF   LATE,1	    ; LED ON	
    Call    Loop
    CALL    Delay_250ms,1
    Call    Loop
    CALL    Delay_250ms,1
   
    N2:
    Call    Loop
    MOVLW   00000010B	    ; w = 00000010
    MOVWF   LATC	    ; LED ON   
    MOVLW   00000010B	    ; w = 00000010
    MOVWF   LATE,1	    ; LED ON
    Call    Loop
    CALL    Delay_250ms,1
    Call    Loop
    CALL    Delay_250ms,1
    N3:
    Call Loop
    MOVLW   00000100B	    ; w = 00000100
    MOVWF   LATC	    ; LED ON
    MOVLW   00000010B	    ; w = 00000010
    MOVWF   LATE,1	    ; LED ON
    Call    Loop
    CALL    Delay_250ms,1
    Call    Loop
    CALL    Delay_250ms,1
    
    N4:
    Call    Loop
    MOVLW   00001000B	    ; w = 00001000
    MOVWF   LATC	    ; LED ON
    MOVLW   00000010B	    ; w = 00000010
    MOVWF   LATE,1	    ; LED ON
    Call    Loop
    CALL    Delay_250ms,1
    Call    Loop
    CALL   Delay_250ms,1
    N5:
    Call    Loop
    MOVLW   00010000B	    ; w = 00010000
    MOVWF   LATC	    ; LED ON
    MOVLW   00000010B	    ; w = 00000010
    MOVWF   LATE,1	    ; LED ON
    Call    Loop
    CALL    Delay_250ms,1
    Call    Loop
    CALL    Delay_250ms,1
    
    N6:
    Call    Loop
    MOVLW   00100000B	    ; w = 00100000
    MOVWF   LATC	    ; LED ON
    MOVLW   00000010B	    ; w = 00000010
    MOVWF   LATE,1	    ; LED ON
    Call    Loop
    CALL    Delay_250ms,1
    Call    Loop
    CALL    Delay_250ms,1
    N7:
    Call    Loop
    MOVLW   01000000B	    ; w = 01000000
    MOVWF   LATC	    ; LED ON
    MOVLW   00000010B	    ; w = 00000010
    MOVWF   LATE,1	    ; LED ON
    Call    Loop
    CALL    Delay_250ms,1
    Call    Loop
    CALL    Delay_250ms,1
    
    N8:
    Call    Loop
    MOVLW   10000000B	    ; w = 10000000
    MOVWF   LATC	    ; LED ON
    MOVLW   00000010B	    ; w = 00000010
    MOVWF   LATE,1	    ; LED ON
    Call    Loop
    CALL    Delay_250ms,1
    Call    Loop
    CALL    Delay_250ms,1
    Call    Loop
    goto    Corr_impar
    

 Config_OSC:
    ;Configuracion del oscilador interno a una frecuencia de 4MHz
    BANKSEL OSCCON1 
    MOVLW   0x60        ;Seleccionamos el bloque del osc con un div:1
    MOVWF   OSCCON1
    MOVLW   0x02        ; Seleccionamos una frecuencia de 4MHz
    MOVWF   OSCFRQ 
    RETURN
   
 Config_Port:  ;PORT-LAT-ANSEL-TRIS	    LED:RF3	BUTTON:RA3
    ;Config Led
    BANKSEL PORTC
    CLRF    PORTC,1	; PORTC = 0 
    CLRF    ANSELC,1	; ANSELF<7:0> = 0 -PORT F DIGITAL
    CLRF    TRISC
    
    ;Config Led
    BANKSEL PORTE
    CLRF    PORTE,1	; PORTF = 0 
    CLRF    ANSELE,1	; ANSELF<7:0> = 0 -PORT F DIGITAL
    CLRF    TRISE
    
    ;Config Button
    BANKSEL PORTA
    CLRF    PORTA,1	; PORTA<7:0> = 0
    CLRF    ANSELA,1	; PortA digital
    BSF	    TRISA,3,1	; RA3 como entrada
    BSF	    WPUA,3,1	; Activamos la resistencia Pull-Up del pin RA3
    RETURN
    
END resetVect



