#include<p18F4550.inc>

loop_cnt1		set	0x00
loop_cnt2		set	0x01

LCD_CONTROL		equ PORTC

				org 0x00
				goto start
				org 0x08
				retfie
				org 0x18
				retfie

dup_nop			macro	kk
				variable	i

i=0
				while i	<	kk
				nop
i+=1
				endw
				endm


;************************************ Main Program ************************************************;

start			CLRF	TRISC,A;Configure TRISD as an output
				CLRF	TRISD,A
				SETF	TRISB,A ;Configure TRISB as an output
				BCF   	TRISB, 4, A
				BCF   	TRISB, 5, A ;Configure Pin 4,5,6,7 as output
				BCF   	TRISB, 6, A
				BCF   	TRISB, 7, A
				SETF	TRISA,A

				CALL	CONFG_LCD1	
	
CHECK			BTFSC	PORTB,0,A
				BRA		SHOWNAME											;push button1		
				CLRF	PORTD,A

CHECK1			BTFSC	PORTB,1,A
				BRA		SHOWID
				CLRF	PORTD,A												;Push Button2

				CALL	KEY1
				CALL	KEY2
				CALL	KEY3
				CALL	KEY4
				CALL	KEY5
				CALL	KEY6
				CALL	KEY7
				CALL	KEY8
				CALL	KEY9
				CALL	KEYSTAR
				CALL	KEY0
				CALL	KEY#

;**************************** Subroutine For Display KEYPAD Button ************************************************;

SHOW1			MOVLW 0xC0			
				MOVWF PORTD,A	
				MOVLW	D'49'
				MOVWF	PORTD,A ;Show 1
				CALL	WriteDATA
				BRA		CHECK	
				RETURN				

SHOW2			MOVLW 0xC0			
				MOVWF PORTD,A
				MOVLW	D'50'
				MOVWF	PORTD,A ;Show 2
				CALL	WriteDATA
				BRA		CHECK		
				RETURN		

SHOW3			MOVLW 0xC0			
				MOVWF PORTD,A
				MOVLW	D'51'
				MOVWF	PORTD,A ;Show 3
				CALL	WriteDATA	
				BRA		CHECK
				RETURN		

SHOW4			MOVLW 0xC0			
				MOVWF PORTD,A
				MOVLW	D'52'
				MOVWF	PORTD,A ;Show 4
				CALL	WriteDATA	
				BRA		CHECK
				RETURN		

SHOW5			MOVLW 0xC0			
				MOVWF PORTD,A
				MOVLW	D'53'
				MOVWF	PORTD,A ;Show 5
				CALL	WriteDATA	
				BRA		CHECK
				RETURN		

SHOW6			MOVLW 0xC0			
				MOVWF PORTD,A
				MOVLW	D'54'
				MOVWF	PORTD,A ;Show 6
				CALL	WriteDATA
				BRA		CHECK		
				RETURN		

SHOW7			MOVLW 0xC0			
				MOVWF PORTD,A
				MOVLW	D'55'
				MOVWF	PORTD,A ;Show 7
				CALL	WriteDATA	
				BRA		CHECK
				RETURN		

SHOW8			MOVLW 0xC0			
				MOVWF PORTD,A
				MOVLW	D'56'
				MOVWF	PORTD,A ;Show 8
				CALL	WriteDATA
				BRA		CHECK	
				RETURN		

SHOW9			MOVLW 0xC0			
				MOVWF PORTD,A
				MOVLW	D'57'
				MOVWF	PORTD,A ;Show 9
				CALL	WriteDATA	
				BRA		CHECK
				RETURN		

SHOWStar		MOVLW 0xC0			
				MOVWF PORTD,A
				MOVLW	D'42'
				MOVWF	PORTD,A ;Show *
				CALL	WriteDATA
				BRA		CHECK	
				RETURN		

SHOW0			MOVLW 0xC0			
				MOVWF PORTD,A
				MOVLW	D'48'
				MOVWF	PORTD,A ;Show 0
				CALL	WriteDATA
				BRA		CHECK	
				RETURN		

SHOW#			MOVLW 0xC0			
				MOVWF PORTD,A
				MOVLW	D'35'
				MOVWF	PORTD,A ;Show #
				CALL	WriteDATA
				BRA		CHECK						
				RETURN

;**************************** Subroutine For PRessing KEYPAD At LCD  ************************************************;	

KEY1	    	CLRF  PORTB, A
				BSF   PORTB, 4, A
				BTFSC PORTA, 4, A	
				BRA   SHOW1
				CLRF  PORTD, A
				RETURN

KEY2	    	CLRF  PORTB, A
				BSF   PORTB, 4, A
				BTFSC PORTB, 2, A
				BRA   SHOW2
				CLRF  PORTD, A
				RETURN

KEY3	    	CLRF  PORTB, A
				BSF   PORTB, 4, A
				BTFSC PORTB, 3, A
				BRA   SHOW3
				CLRF  PORTD, A
				RETURN

KEY4	    	CLRF  PORTB, A
				BSF   PORTB, 5, A
				BTFSC PORTA, 4, A	
				BRA   SHOW4
				CLRF  PORTD, A
				RETURN

KEY5	    	CLRF  PORTB, A
				BSF   PORTB, 5, A
				BTFSC PORTB, 2, A
				BRA   SHOW5
				CLRF  PORTD, A
				RETURN

KEY6	    	CLRF  PORTB, A
				BSF   PORTB, 5, A
				BTFSC PORTB, 3, A
				BRA   SHOW6
				CLRF  PORTD, A
				RETURN

KEY7	    	CLRF  PORTB, A
				BSF   PORTB, 6, A
				BTFSC PORTA, 4, A
				BRA   SHOW7
				CLRF  PORTD, A
				RETURN

KEY8	    	CLRF  PORTB, A
				BSF   PORTB, 6, A
				BTFSC PORTB, 2, A
				BRA   SHOW8
				CLRF  PORTD, A
				RETURN

KEY9     		CLRF  PORTB, A
				BSF   PORTB, 6, A
				BTFSC PORTB, 3, A
				BRA   SHOW9
				CLRF  PORTD, A
				RETURN

KEYSTAR     	CLRF  PORTB, A
				BSF   PORTB, 7, A
				BTFSC PORTA, 4, A
				BRA   SHOWStar
				CLRF  PORTD, A
				RETURN

KEY0     		CLRF  PORTB, A
				BSF   PORTB, 7, A
				BTFSC PORTB, 2, A
				BRA   SHOW0
				CLRF  PORTD, A
				RETURN
			
KEY#     		CLRF  PORTB, A
				BSF   PORTB, 7, A
				BTFSC PORTB, 3, A
				BRA   SHOW#
				CLRF  PORTD, A
				RETURN




;***************** Subroutine To Show Name In LCD ********************************;

SHOWNAME		MOVLW	D'66'
				MOVWF	PORTD,A ;Show B
				CALL	WriteDATA

				MOVLW	D'65'
				MOVWF	PORTD,A ; Show A
				CALL	WriteDATA

				MOVLW	D'84'
				MOVWF	PORTD,A ; SHOW T
				CALL	WriteDATA

				MOVLW	D'82'
				MOVWF	PORTD,A ;SHOW R
				CALL	WriteDATA

				MOVLW	D'73'
				MOVWF	PORTD,A ;SHOW I
				CALL	WriteDATA
	
				MOVLW	D'83'
				MOVWF	PORTD,A ;SHOW S
				CALL	WriteDATA
	
				MOVLW	D'89'
				MOVWF	PORTD,A ;SHOW Y
				CALL	WriteDATA

				MOVLW	D'73'
				MOVWF	PORTD,A ;SHOW I
				CALL	WriteDATA

				MOVLW	D'65'
				MOVWF	PORTD,A ; Show A
				CALL	WriteDATA

				MOVLW	0x01
				MOVWF	PORTD,A
				
				CALL	WriteCOMMAND
				BRA		CHECK
			
				RETURN


;***************** Subroutine To Show ID In LCD ********************************;

SHOWID			MOVLW	D'68'
				MOVWF	PORTD,A ;Show D
				CALL	WriteDATA

				MOVLW	D'69'
				MOVWF	PORTD,A ;SHOW E
				CALL	WriteDATA
				
				MOVLW	D'57'
				MOVWF	PORTD,A ;SHOW 9
				CALL	WriteDATA
			
				MOVLW	D'54'
				MOVWF	PORTD,A ; SHOW 6
				CALL	WriteDATA

				MOVLW	D'53'
				MOVWF	PORTD,A ;SHOW 5
				CALL	WriteDATA
		
				MOVLW	D'49'
				MOVWF	PORTD,A ;SHOW 1
				CALL	WriteDATA
				
				MOVLW	D'49'
				MOVWF	PORTD,A ; SHOW 1
				CALL	WriteDATA

				MOVLW	0x01
				MOVWF	PORTD,A
				CALL	WriteCOMMAND
				BRA		CHECK1
	
				RETURN

;********************************** Subroutine For LCD ************************************************;

WriteCOMMAND	BCF		LCD_CONTROL	,4,A ;RS = 0
				BCF		LCD_CONTROL	,5,A ;RW = 0
				BSF		LCD_CONTROL	,6,A ;EN = 1
				CALL	DELAY1SEC
				BCF		LCD_CONTROL,6,A ;EN = 0 ;LCD Command
				RETURN	

WriteDATA		BSF		LCD_CONTROL	,4,A ;RS = 1
				BCF		LCD_CONTROL	,5,A ;RW = 0
				BSF		LCD_CONTROL	,6,A ;EN = 1
				CALL	DELAY1SEC
				BCF		LCD_CONTROL	,6,A ;EN = 0 ;Send Data
				RETURN

CONFG_LCD1		MOVLW	0x38
				MOVWF	PORTD,A ;Configure 2 lines and 5x7 matrix
				CALL	WriteCOMMAND

				MOVLW	0x0F											
				MOVWF	PORTD,A ;Turn display On, Cursor Blinking
				CALL	WriteCOMMAND

				MOVLW	0x01
				MOVWF	PORTD,A ;Clear Screen
				CALL	WriteCOMMAND

				MOVLW	0x80
				MOVWF	PORTD,A ;Begin at First Line
				CALL	WriteCOMMAND
				RETURN	

CONFG_LCD2		MOVLW	0x38
				MOVWF	PORTD,A ;Configure 2 lines and 5x7 matrix
				CALL	WriteCOMMAND

				MOVLW	0x0F
				MOVWF	PORTD,A ;Turn display On, Cursor Blinking
				CALL	WriteCOMMAND

				MOVLW	0x01
				MOVWF	PORTD,A ;Clear Screen
				CALL	WriteCOMMAND

				MOVLW	0xC0
				MOVWF	PORTD,A ;Begin at 2nd Line
				CALL	WriteCOMMAND
				RETURN
				
;****************** Subroutine Delay for 1 Sec With 20Mhz Crystal Frequency ************;

DELAY1SEC		MOVLW	D'80'
				MOVWF	loop_cnt2,A
AGAIN1			MOVLW	D'250'
				MOVWF	loop_cnt1,A
AGAIN2			dup_nop	D'247'
				DECFSZ	loop_cnt1,F,A
				BRA		AGAIN2
				DECFSZ	loop_cnt2,F,A
				BRA		AGAIN1
				NOP
				RETURN


				END
	
				


