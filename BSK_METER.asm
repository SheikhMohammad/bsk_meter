
_mask:

;BSK_METER.c,51 :: 		unsigned short mask(unsigned short num) {
;BSK_METER.c,52 :: 		switch (num) {
	GOTO       L_mask0
;BSK_METER.c,53 :: 		case 0 : return 0b00000001;
L_mask2:
	MOVLW      1
	MOVWF      R0+0
	GOTO       L_end_mask
;BSK_METER.c,54 :: 		case 1 : return 0b01001111;
L_mask3:
	MOVLW      79
	MOVWF      R0+0
	GOTO       L_end_mask
;BSK_METER.c,55 :: 		case 2 : return 0b00010010;
L_mask4:
	MOVLW      18
	MOVWF      R0+0
	GOTO       L_end_mask
;BSK_METER.c,56 :: 		case 3 : return 0b00000110;
L_mask5:
	MOVLW      6
	MOVWF      R0+0
	GOTO       L_end_mask
;BSK_METER.c,57 :: 		case 4 : return 0b01001100;
L_mask6:
	MOVLW      76
	MOVWF      R0+0
	GOTO       L_end_mask
;BSK_METER.c,58 :: 		case 5 : return 0b00100100;
L_mask7:
	MOVLW      36
	MOVWF      R0+0
	GOTO       L_end_mask
;BSK_METER.c,59 :: 		case 6 : return 0b00100000;
L_mask8:
	MOVLW      32
	MOVWF      R0+0
	GOTO       L_end_mask
;BSK_METER.c,60 :: 		case 7 : return 0b00001111;
L_mask9:
	MOVLW      15
	MOVWF      R0+0
	GOTO       L_end_mask
;BSK_METER.c,61 :: 		case 8 : return 0b00000000;
L_mask10:
	CLRF       R0+0
	GOTO       L_end_mask
;BSK_METER.c,62 :: 		case 9 : return 0b00000100;
L_mask11:
	MOVLW      4
	MOVWF      R0+0
	GOTO       L_end_mask
;BSK_METER.c,63 :: 		} //case end --------abcdefg
L_mask0:
	MOVF       FARG_mask_num+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_mask2
	MOVF       FARG_mask_num+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_mask3
	MOVF       FARG_mask_num+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_mask4
	MOVF       FARG_mask_num+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_mask5
	MOVF       FARG_mask_num+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_mask6
	MOVF       FARG_mask_num+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_mask7
	MOVF       FARG_mask_num+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_mask8
	MOVF       FARG_mask_num+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_mask9
	MOVF       FARG_mask_num+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_mask10
	MOVF       FARG_mask_num+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_mask11
;BSK_METER.c,64 :: 		}
L_end_mask:
	RETURN
; end of _mask

_Display_Data:

;BSK_METER.c,67 :: 		void Display_Data()
;BSK_METER.c,69 :: 		for (i = 0; i<=120; i++)  // DATA TOTAL DELAY= 8ms X 120 = 960ms
	CLRF       _i+0
	CLRF       _i+1
L_Display_Data12:
	MOVF       _i+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__Display_Data41
	MOVF       _i+0, 0
	SUBLW      120
L__Display_Data41:
	BTFSS      STATUS+0, 0
	GOTO       L_Display_Data13
;BSK_METER.c,72 :: 		BB2 = 1;
	BSF        RC0_bit+0, BitPos(RC0_bit+0)
;BSK_METER.c,73 :: 		BB1 = 0;
	BCF        RC1_bit+0, BitPos(RC1_bit+0)
;BSK_METER.c,74 :: 		SS3 = 0;
	BCF        RC2_bit+0, BitPos(RC2_bit+0)
;BSK_METER.c,75 :: 		SS2 = 0;
	BCF        RC3_bit+0, BitPos(RC3_bit+0)
;BSK_METER.c,76 :: 		SS1 = 0;
	BCF        RC4_bit+0, BitPos(RC4_bit+0)
;BSK_METER.c,77 :: 		KK3 = 0;
	BCF        RC5_bit+0, BitPos(RC5_bit+0)
;BSK_METER.c,78 :: 		KK2 = 0;
	BCF        RC6_bit+0, BitPos(RC6_bit+0)
;BSK_METER.c,79 :: 		KK1 = 0;
	BCF        RC7_bit+0, BitPos(RC7_bit+0)
;BSK_METER.c,80 :: 		PORTB = BBD2;
	MOVF       _BBD2+0, 0
	MOVWF      PORTB+0
;BSK_METER.c,81 :: 		delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_Display_Data15:
	DECFSZ     R13+0, 1
	GOTO       L_Display_Data15
	DECFSZ     R12+0, 1
	GOTO       L_Display_Data15
;BSK_METER.c,82 :: 		PORTB = 0b11111111;
	MOVLW      255
	MOVWF      PORTB+0
;BSK_METER.c,84 :: 		BB2 = 0;
	BCF        RC0_bit+0, BitPos(RC0_bit+0)
;BSK_METER.c,85 :: 		BB1 = 1;
	BSF        RC1_bit+0, BitPos(RC1_bit+0)
;BSK_METER.c,86 :: 		SS3 = 0;
	BCF        RC2_bit+0, BitPos(RC2_bit+0)
;BSK_METER.c,87 :: 		SS2 = 0;
	BCF        RC3_bit+0, BitPos(RC3_bit+0)
;BSK_METER.c,88 :: 		SS1 = 0;
	BCF        RC4_bit+0, BitPos(RC4_bit+0)
;BSK_METER.c,89 :: 		KK3 = 0;
	BCF        RC5_bit+0, BitPos(RC5_bit+0)
;BSK_METER.c,90 :: 		KK2 = 0;
	BCF        RC6_bit+0, BitPos(RC6_bit+0)
;BSK_METER.c,91 :: 		KK1 = 0;
	BCF        RC7_bit+0, BitPos(RC7_bit+0)
;BSK_METER.c,92 :: 		PORTB = BBD1;
	MOVF       _BBD1+0, 0
	MOVWF      PORTB+0
;BSK_METER.c,93 :: 		delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_Display_Data16:
	DECFSZ     R13+0, 1
	GOTO       L_Display_Data16
	DECFSZ     R12+0, 1
	GOTO       L_Display_Data16
;BSK_METER.c,94 :: 		PORTB = 0b11111111;
	MOVLW      255
	MOVWF      PORTB+0
;BSK_METER.c,96 :: 		BB2 = 0;
	BCF        RC0_bit+0, BitPos(RC0_bit+0)
;BSK_METER.c,97 :: 		BB1 = 0;
	BCF        RC1_bit+0, BitPos(RC1_bit+0)
;BSK_METER.c,98 :: 		SS3 = 1;
	BSF        RC2_bit+0, BitPos(RC2_bit+0)
;BSK_METER.c,99 :: 		SS2 = 0;
	BCF        RC3_bit+0, BitPos(RC3_bit+0)
;BSK_METER.c,100 :: 		SS1 = 0;
	BCF        RC4_bit+0, BitPos(RC4_bit+0)
;BSK_METER.c,101 :: 		KK3 = 0;
	BCF        RC5_bit+0, BitPos(RC5_bit+0)
;BSK_METER.c,102 :: 		KK2 = 0;
	BCF        RC6_bit+0, BitPos(RC6_bit+0)
;BSK_METER.c,103 :: 		KK1 = 0;
	BCF        RC7_bit+0, BitPos(RC7_bit+0)
;BSK_METER.c,104 :: 		PORTB = SSD3;
	MOVF       _SSD3+0, 0
	MOVWF      PORTB+0
;BSK_METER.c,105 :: 		delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_Display_Data17:
	DECFSZ     R13+0, 1
	GOTO       L_Display_Data17
	DECFSZ     R12+0, 1
	GOTO       L_Display_Data17
;BSK_METER.c,106 :: 		PORTB = 0b11111111;
	MOVLW      255
	MOVWF      PORTB+0
;BSK_METER.c,108 :: 		BB2 = 0;
	BCF        RC0_bit+0, BitPos(RC0_bit+0)
;BSK_METER.c,109 :: 		BB1 = 0;
	BCF        RC1_bit+0, BitPos(RC1_bit+0)
;BSK_METER.c,110 :: 		SS3 = 0;
	BCF        RC2_bit+0, BitPos(RC2_bit+0)
;BSK_METER.c,111 :: 		SS2 = 1;
	BSF        RC3_bit+0, BitPos(RC3_bit+0)
;BSK_METER.c,112 :: 		SS1 = 0;
	BCF        RC4_bit+0, BitPos(RC4_bit+0)
;BSK_METER.c,113 :: 		KK3 = 0;
	BCF        RC5_bit+0, BitPos(RC5_bit+0)
;BSK_METER.c,114 :: 		KK2 = 0;
	BCF        RC6_bit+0, BitPos(RC6_bit+0)
;BSK_METER.c,115 :: 		KK1 = 0;
	BCF        RC7_bit+0, BitPos(RC7_bit+0)
;BSK_METER.c,116 :: 		PORTB = SSD2;
	MOVF       _SSD2+0, 0
	MOVWF      PORTB+0
;BSK_METER.c,117 :: 		delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_Display_Data18:
	DECFSZ     R13+0, 1
	GOTO       L_Display_Data18
	DECFSZ     R12+0, 1
	GOTO       L_Display_Data18
;BSK_METER.c,118 :: 		PORTB = 0b11111111;
	MOVLW      255
	MOVWF      PORTB+0
;BSK_METER.c,120 :: 		BB2 = 0;
	BCF        RC0_bit+0, BitPos(RC0_bit+0)
;BSK_METER.c,121 :: 		BB1 = 0;
	BCF        RC1_bit+0, BitPos(RC1_bit+0)
;BSK_METER.c,122 :: 		SS3 = 0;
	BCF        RC2_bit+0, BitPos(RC2_bit+0)
;BSK_METER.c,123 :: 		SS2 = 0;
	BCF        RC3_bit+0, BitPos(RC3_bit+0)
;BSK_METER.c,124 :: 		SS1 = 1;
	BSF        RC4_bit+0, BitPos(RC4_bit+0)
;BSK_METER.c,125 :: 		KK3 = 0;
	BCF        RC5_bit+0, BitPos(RC5_bit+0)
;BSK_METER.c,126 :: 		KK2 = 0;
	BCF        RC6_bit+0, BitPos(RC6_bit+0)
;BSK_METER.c,127 :: 		KK1 = 0;
	BCF        RC7_bit+0, BitPos(RC7_bit+0)
;BSK_METER.c,128 :: 		PORTB = SSD1;
	MOVF       _SSD1+0, 0
	MOVWF      PORTB+0
;BSK_METER.c,129 :: 		delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_Display_Data19:
	DECFSZ     R13+0, 1
	GOTO       L_Display_Data19
	DECFSZ     R12+0, 1
	GOTO       L_Display_Data19
;BSK_METER.c,130 :: 		PORTB = 0b11111111;
	MOVLW      255
	MOVWF      PORTB+0
;BSK_METER.c,132 :: 		BB2 = 0;
	BCF        RC0_bit+0, BitPos(RC0_bit+0)
;BSK_METER.c,133 :: 		BB1 = 0;
	BCF        RC1_bit+0, BitPos(RC1_bit+0)
;BSK_METER.c,134 :: 		SS3 = 0;
	BCF        RC2_bit+0, BitPos(RC2_bit+0)
;BSK_METER.c,135 :: 		SS2 = 0;
	BCF        RC3_bit+0, BitPos(RC3_bit+0)
;BSK_METER.c,136 :: 		SS1 = 0;
	BCF        RC4_bit+0, BitPos(RC4_bit+0)
;BSK_METER.c,137 :: 		KK3 = 1;
	BSF        RC5_bit+0, BitPos(RC5_bit+0)
;BSK_METER.c,138 :: 		KK2 = 0;
	BCF        RC6_bit+0, BitPos(RC6_bit+0)
;BSK_METER.c,139 :: 		KK1 = 0;
	BCF        RC7_bit+0, BitPos(RC7_bit+0)
;BSK_METER.c,140 :: 		PORTB = KKD3;
	MOVF       _KKD3+0, 0
	MOVWF      PORTB+0
;BSK_METER.c,141 :: 		delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_Display_Data20:
	DECFSZ     R13+0, 1
	GOTO       L_Display_Data20
	DECFSZ     R12+0, 1
	GOTO       L_Display_Data20
;BSK_METER.c,142 :: 		PORTB = 0b11111111;
	MOVLW      255
	MOVWF      PORTB+0
;BSK_METER.c,144 :: 		BB2 = 0;
	BCF        RC0_bit+0, BitPos(RC0_bit+0)
;BSK_METER.c,145 :: 		BB1 = 0;
	BCF        RC1_bit+0, BitPos(RC1_bit+0)
;BSK_METER.c,146 :: 		SS3 = 0;
	BCF        RC2_bit+0, BitPos(RC2_bit+0)
;BSK_METER.c,147 :: 		SS2 = 0;
	BCF        RC3_bit+0, BitPos(RC3_bit+0)
;BSK_METER.c,148 :: 		SS1 = 0;
	BCF        RC4_bit+0, BitPos(RC4_bit+0)
;BSK_METER.c,149 :: 		KK3 = 0;
	BCF        RC5_bit+0, BitPos(RC5_bit+0)
;BSK_METER.c,150 :: 		KK2 = 1;
	BSF        RC6_bit+0, BitPos(RC6_bit+0)
;BSK_METER.c,151 :: 		KK1 = 0;
	BCF        RC7_bit+0, BitPos(RC7_bit+0)
;BSK_METER.c,152 :: 		PORTB = KKD2;
	MOVF       _KKD2+0, 0
	MOVWF      PORTB+0
;BSK_METER.c,153 :: 		delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_Display_Data21:
	DECFSZ     R13+0, 1
	GOTO       L_Display_Data21
	DECFSZ     R12+0, 1
	GOTO       L_Display_Data21
;BSK_METER.c,154 :: 		PORTB = 0b11111111;
	MOVLW      255
	MOVWF      PORTB+0
;BSK_METER.c,156 :: 		BB2 = 0;
	BCF        RC0_bit+0, BitPos(RC0_bit+0)
;BSK_METER.c,157 :: 		BB1 = 0;
	BCF        RC1_bit+0, BitPos(RC1_bit+0)
;BSK_METER.c,158 :: 		SS3 = 0;
	BCF        RC2_bit+0, BitPos(RC2_bit+0)
;BSK_METER.c,159 :: 		SS2 = 0;
	BCF        RC3_bit+0, BitPos(RC3_bit+0)
;BSK_METER.c,160 :: 		SS1 = 0;
	BCF        RC4_bit+0, BitPos(RC4_bit+0)
;BSK_METER.c,161 :: 		KK3 = 0;
	BCF        RC5_bit+0, BitPos(RC5_bit+0)
;BSK_METER.c,162 :: 		KK2 = 0;
	BCF        RC6_bit+0, BitPos(RC6_bit+0)
;BSK_METER.c,163 :: 		KK1 = 1;
	BSF        RC7_bit+0, BitPos(RC7_bit+0)
;BSK_METER.c,164 :: 		PORTB = KKD1;
	MOVF       _KKD1+0, 0
	MOVWF      PORTB+0
;BSK_METER.c,165 :: 		delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_Display_Data22:
	DECFSZ     R13+0, 1
	GOTO       L_Display_Data22
	DECFSZ     R12+0, 1
	GOTO       L_Display_Data22
;BSK_METER.c,166 :: 		PORTB = 0b11111111;
	MOVLW      255
	MOVWF      PORTB+0
;BSK_METER.c,69 :: 		for (i = 0; i<=120; i++)  // DATA TOTAL DELAY= 8ms X 120 = 960ms
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;BSK_METER.c,168 :: 		}
	GOTO       L_Display_Data12
L_Display_Data13:
;BSK_METER.c,169 :: 		}
L_end_Display_Data:
	RETURN
; end of _Display_Data

_LOGIC_:

;BSK_METER.c,171 :: 		void LOGIC_()
;BSK_METER.c,173 :: 		if (RAW_ADC<=40) {ALARM=1; delay_ms(1000); ALARM=0;}
	MOVF       _RAW_ADC+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__LOGIC_43
	MOVF       _RAW_ADC+0, 0
	SUBLW      40
L__LOGIC_43:
	BTFSS      STATUS+0, 0
	GOTO       L_LOGIC_23
	BSF        RA5_bit+0, BitPos(RA5_bit+0)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_LOGIC_24:
	DECFSZ     R13+0, 1
	GOTO       L_LOGIC_24
	DECFSZ     R12+0, 1
	GOTO       L_LOGIC_24
	DECFSZ     R11+0, 1
	GOTO       L_LOGIC_24
	NOP
	NOP
	BCF        RA5_bit+0, BitPos(RA5_bit+0)
L_LOGIC_23:
;BSK_METER.c,174 :: 		}
L_end_LOGIC_:
	RETURN
; end of _LOGIC_

_DVM:

;BSK_METER.c,176 :: 		void DVM()
;BSK_METER.c,178 :: 		DisplayVolt = RAW_ADC;
	MOVF       _RAW_ADC+0, 0
	MOVWF      _DisplayVolt+0
	MOVF       _RAW_ADC+1, 0
	MOVWF      _DisplayVolt+1
	CLRF       _DisplayVolt+2
	CLRF       _DisplayVolt+3
;BSK_METER.c,179 :: 		BBD1 = (DisplayVolt/1)%10;  // Extract DD1
	MOVLW      10
	MOVWF      R4+0
	CLRF       R4+1
	CLRF       R4+2
	CLRF       R4+3
	MOVF       _DisplayVolt+0, 0
	MOVWF      R0+0
	MOVF       _DisplayVolt+1, 0
	MOVWF      R0+1
	MOVF       _DisplayVolt+2, 0
	MOVWF      R0+2
	MOVF       _DisplayVolt+3, 0
	MOVWF      R0+3
	CALL       _Div_32x32_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R8+2, 0
	MOVWF      R0+2
	MOVF       R8+3, 0
	MOVWF      R0+3
	MOVF       R0+0, 0
	MOVWF      _BBD1+0
	MOVF       R0+1, 0
	MOVWF      _BBD1+1
;BSK_METER.c,180 :: 		BBD1 = mask(BBD1);
	MOVF       R0+0, 0
	MOVWF      FARG_mask_num+0
	CALL       _mask+0
	MOVF       R0+0, 0
	MOVWF      _BBD1+0
	CLRF       _BBD1+1
;BSK_METER.c,181 :: 		BBD2 = (DisplayVolt/10)%10;
	MOVLW      10
	MOVWF      R4+0
	CLRF       R4+1
	CLRF       R4+2
	CLRF       R4+3
	MOVF       _DisplayVolt+0, 0
	MOVWF      R0+0
	MOVF       _DisplayVolt+1, 0
	MOVWF      R0+1
	MOVF       _DisplayVolt+2, 0
	MOVWF      R0+2
	MOVF       _DisplayVolt+3, 0
	MOVWF      R0+3
	CALL       _Div_32x32_S+0
	MOVLW      10
	MOVWF      R4+0
	CLRF       R4+1
	CLRF       R4+2
	CLRF       R4+3
	CALL       _Div_32x32_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R8+2, 0
	MOVWF      R0+2
	MOVF       R8+3, 0
	MOVWF      R0+3
	MOVF       R0+0, 0
	MOVWF      _BBD2+0
	MOVF       R0+1, 0
	MOVWF      _BBD2+1
;BSK_METER.c,182 :: 		BBD2 = mask(BBD2);
	MOVF       R0+0, 0
	MOVWF      FARG_mask_num+0
	CALL       _mask+0
	MOVF       R0+0, 0
	MOVWF      _BBD2+0
	CLRF       _BBD2+1
;BSK_METER.c,183 :: 		Display_Data();
	CALL       _Display_Data+0
;BSK_METER.c,184 :: 		}
L_end_DVM:
	RETURN
; end of _DVM

_BATT_HAR:

;BSK_METER.c,186 :: 		void BATT_HAR()
;BSK_METER.c,188 :: 		if(RAW_ADC<=41) // BATT LOW = 41V
	MOVF       _RAW_ADC+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__BATT_HAR46
	MOVF       _RAW_ADC+0, 0
	SUBLW      41
L__BATT_HAR46:
	BTFSS      STATUS+0, 0
	GOTO       L_BATT_HAR25
;BSK_METER.c,190 :: 		BBD2=0b01110001;
	MOVLW      113
	MOVWF      _BBD2+0
	MOVLW      0
	MOVWF      _BBD2+1
;BSK_METER.c,191 :: 		BBD1=0b01100010;
	MOVLW      98
	MOVWF      _BBD1+0
	MOVLW      0
	MOVWF      _BBD1+1
;BSK_METER.c,192 :: 		Display_Data();
	CALL       _Display_Data+0
;BSK_METER.c,194 :: 		}
L_BATT_HAR25:
;BSK_METER.c,196 :: 		if(RAW_ADC>=52) //BATT FULL = 52V
	MOVLW      0
	SUBWF      _RAW_ADC+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__BATT_HAR47
	MOVLW      52
	SUBWF      _RAW_ADC+0, 0
L__BATT_HAR47:
	BTFSS      STATUS+0, 0
	GOTO       L_BATT_HAR26
;BSK_METER.c,198 :: 		BBD2=0b00111000;
	MOVLW      56
	MOVWF      _BBD2+0
	MOVLW      0
	MOVWF      _BBD2+1
;BSK_METER.c,199 :: 		BBD1=0b01110001;
	MOVLW      113
	MOVWF      _BBD1+0
	MOVLW      0
	MOVWF      _BBD1+1
;BSK_METER.c,200 :: 		Display_Data();
	CALL       _Display_Data+0
;BSK_METER.c,201 :: 		}
L_BATT_HAR26:
;BSK_METER.c,203 :: 		if ((RAW_ADC>=42)&&(RAW_ADC<=51))
	MOVLW      0
	SUBWF      _RAW_ADC+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__BATT_HAR48
	MOVLW      42
	SUBWF      _RAW_ADC+0, 0
L__BATT_HAR48:
	BTFSS      STATUS+0, 0
	GOTO       L_BATT_HAR29
	MOVF       _RAW_ADC+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__BATT_HAR49
	MOVF       _RAW_ADC+0, 0
	SUBLW      51
L__BATT_HAR49:
	BTFSS      STATUS+0, 0
	GOTO       L_BATT_HAR29
L__BATT_HAR38:
;BSK_METER.c,205 :: 		HAR = (RAW_ADC-42)*11.1; //51-42=9, 11.1X9=99.9%
	MOVLW      42
	SUBWF      _RAW_ADC+0, 0
	MOVWF      R0+0
	MOVLW      0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      _RAW_ADC+1, 0
	MOVWF      R0+1
	CALL       _Word2Double+0
	MOVLW      154
	MOVWF      R4+0
	MOVLW      153
	MOVWF      R4+1
	MOVLW      49
	MOVWF      R4+2
	MOVLW      130
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	CALL       _Double2Word+0
	MOVF       R0+0, 0
	MOVWF      _HAR+0
	MOVF       R0+1, 0
	MOVWF      _HAR+1
;BSK_METER.c,206 :: 		BBD1 = (HAR/1)%10;  // Extract DD1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _BBD1+0
	MOVF       R0+1, 0
	MOVWF      _BBD1+1
;BSK_METER.c,207 :: 		BBD1 = mask(BBD1);
	MOVF       R0+0, 0
	MOVWF      FARG_mask_num+0
	CALL       _mask+0
	MOVF       R0+0, 0
	MOVWF      _BBD1+0
	CLRF       _BBD1+1
;BSK_METER.c,208 :: 		BBD2 = (HAR/10)%10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _HAR+0, 0
	MOVWF      R0+0
	MOVF       _HAR+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_U+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _BBD2+0
	MOVF       R0+1, 0
	MOVWF      _BBD2+1
;BSK_METER.c,209 :: 		BBD2 = mask(BBD2);
	MOVF       R0+0, 0
	MOVWF      FARG_mask_num+0
	CALL       _mask+0
	MOVF       R0+0, 0
	MOVWF      _BBD2+0
	CLRF       _BBD2+1
;BSK_METER.c,210 :: 		Display_Data();
	CALL       _Display_Data+0
;BSK_METER.c,211 :: 		}
L_BATT_HAR29:
;BSK_METER.c,212 :: 		}
L_end_BATT_HAR:
	RETURN
; end of _BATT_HAR

_SPEED:

;BSK_METER.c,217 :: 		void SPEED(){
;BSK_METER.c,219 :: 		SPEED_TEMP= SPEED_TEMP+ TMR0*2.25; // DISTANCE IN EVERY SEC
	MOVF       TMR0+0, 0
	MOVWF      R0+0
	CALL       _Byte2Double+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      16
	MOVWF      R4+2
	MOVLW      128
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      FLOC__SPEED+0
	MOVF       R0+1, 0
	MOVWF      FLOC__SPEED+1
	MOVF       R0+2, 0
	MOVWF      FLOC__SPEED+2
	MOVF       R0+3, 0
	MOVWF      FLOC__SPEED+3
	MOVF       _SPEED_TEMP+0, 0
	MOVWF      R0+0
	MOVF       _SPEED_TEMP+1, 0
	MOVWF      R0+1
	CALL       _Word2Double+0
	MOVF       FLOC__SPEED+0, 0
	MOVWF      R4+0
	MOVF       FLOC__SPEED+1, 0
	MOVWF      R4+1
	MOVF       FLOC__SPEED+2, 0
	MOVWF      R4+2
	MOVF       FLOC__SPEED+3, 0
	MOVWF      R4+3
	CALL       _Add_32x32_FP+0
	CALL       _Double2Word+0
	MOVF       R0+0, 0
	MOVWF      _SPEED_TEMP+0
	MOVF       R0+1, 0
	MOVWF      _SPEED_TEMP+1
;BSK_METER.c,220 :: 		if(SPEED_TEMP>=1000){SPEED_TEMP=0; K_DATA++;}
	MOVLW      3
	SUBWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__SPEED51
	MOVLW      232
	SUBWF      R0+0, 0
L__SPEED51:
	BTFSS      STATUS+0, 0
	GOTO       L_SPEED30
	CLRF       _SPEED_TEMP+0
	CLRF       _SPEED_TEMP+1
	INCF       _K_DATA+0, 1
	BTFSC      STATUS+0, 2
	INCF       _K_DATA+1, 1
L_SPEED30:
;BSK_METER.c,222 :: 		S_DATA= TMR0*2.25*1.2;  //TMR0*2.25*3600/1000/8. THERE IS 3 DISPLAY DELAY 3 SEC
	MOVF       TMR0+0, 0
	MOVWF      R0+0
	CALL       _Byte2Double+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      16
	MOVWF      R4+2
	MOVLW      128
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVLW      154
	MOVWF      R4+0
	MOVLW      153
	MOVWF      R4+1
	MOVLW      25
	MOVWF      R4+2
	MOVLW      127
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	CALL       _Double2Word+0
	MOVF       R0+0, 0
	MOVWF      _S_DATA+0
	MOVF       R0+1, 0
	MOVWF      _S_DATA+1
;BSK_METER.c,227 :: 		TMR0 = 0;
	CLRF       TMR0+0
;BSK_METER.c,230 :: 		SSD1 = (S_DATA/1)%10;  // Extract DD1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _SSD1+0
	MOVF       R0+1, 0
	MOVWF      _SSD1+1
;BSK_METER.c,231 :: 		SSD1 = mask(SSD1);
	MOVF       R0+0, 0
	MOVWF      FARG_mask_num+0
	CALL       _mask+0
	MOVF       R0+0, 0
	MOVWF      _SSD1+0
	CLRF       _SSD1+1
;BSK_METER.c,232 :: 		SSD2 = (S_DATA/10)%10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _S_DATA+0, 0
	MOVWF      R0+0
	MOVF       _S_DATA+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_U+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _SSD2+0
	MOVF       R0+1, 0
	MOVWF      _SSD2+1
;BSK_METER.c,233 :: 		SSD2 = mask(SSD2);
	MOVF       R0+0, 0
	MOVWF      FARG_mask_num+0
	CALL       _mask+0
	MOVF       R0+0, 0
	MOVWF      _SSD2+0
	CLRF       _SSD2+1
;BSK_METER.c,234 :: 		SSD3 = (S_DATA/100)%10;
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _S_DATA+0, 0
	MOVWF      R0+0
	MOVF       _S_DATA+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_U+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _SSD3+0
	MOVF       R0+1, 0
	MOVWF      _SSD3+1
;BSK_METER.c,235 :: 		SSD3 = mask(SSD3);
	MOVF       R0+0, 0
	MOVWF      FARG_mask_num+0
	CALL       _mask+0
	MOVF       R0+0, 0
	MOVWF      _SSD3+0
	CLRF       _SSD3+1
;BSK_METER.c,237 :: 		Display_Data();
	CALL       _Display_Data+0
;BSK_METER.c,239 :: 		}
L_end_SPEED:
	RETURN
; end of _SPEED

_KILO:

;BSK_METER.c,242 :: 		void KILO(){
;BSK_METER.c,243 :: 		KKD1 = (K_DATA/1)%10;  // Extract DD1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _K_DATA+0, 0
	MOVWF      R0+0
	MOVF       _K_DATA+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _KKD1+0
	MOVF       R0+1, 0
	MOVWF      _KKD1+1
;BSK_METER.c,244 :: 		KKD1 = mask(KKD1);
	MOVF       R0+0, 0
	MOVWF      FARG_mask_num+0
	CALL       _mask+0
	MOVF       R0+0, 0
	MOVWF      _KKD1+0
	CLRF       _KKD1+1
;BSK_METER.c,245 :: 		KKD2 = (K_DATA/10)%10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _K_DATA+0, 0
	MOVWF      R0+0
	MOVF       _K_DATA+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_U+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _KKD2+0
	MOVF       R0+1, 0
	MOVWF      _KKD2+1
;BSK_METER.c,246 :: 		KKD2 = mask(KKD2);
	MOVF       R0+0, 0
	MOVWF      FARG_mask_num+0
	CALL       _mask+0
	MOVF       R0+0, 0
	MOVWF      _KKD2+0
	CLRF       _KKD2+1
;BSK_METER.c,247 :: 		KKD3 = (K_DATA/100)%10;
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _K_DATA+0, 0
	MOVWF      R0+0
	MOVF       _K_DATA+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_U+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _KKD3+0
	MOVF       R0+1, 0
	MOVWF      _KKD3+1
;BSK_METER.c,248 :: 		KKD3 = mask(KKD3);
	MOVF       R0+0, 0
	MOVWF      FARG_mask_num+0
	CALL       _mask+0
	MOVF       R0+0, 0
	MOVWF      _KKD3+0
	CLRF       _KKD3+1
;BSK_METER.c,250 :: 		Display_Data();
	CALL       _Display_Data+0
;BSK_METER.c,251 :: 		}
L_end_KILO:
	RETURN
; end of _KILO

_Get_ADC:

;BSK_METER.c,254 :: 		unsigned Get_ADC(){
;BSK_METER.c,255 :: 		ADCON0.GO_NOT_DONE = 1;     // start conversion
	BSF        ADCON0+0, 2
;BSK_METER.c,256 :: 		while (ADCON0.GO_NOT_DONE); // wait for conversion
L_Get_ADC31:
	BTFSS      ADCON0+0, 2
	GOTO       L_Get_ADC32
	GOTO       L_Get_ADC31
L_Get_ADC32:
;BSK_METER.c,257 :: 		return ADRES*2; // return value 256X2=512
	MOVF       ADRES+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
;BSK_METER.c,258 :: 		}
L_end_Get_ADC:
	RETURN
; end of _Get_ADC

_main:

;BSK_METER.c,261 :: 		void main() {
;BSK_METER.c,262 :: 		TRISB = 0x0; // ALL PINS R OUTPUT
	CLRF       TRISB+0
;BSK_METER.c,263 :: 		TRISC = 0x0; //ALL PINS R OUTPUT
	CLRF       TRISC+0
;BSK_METER.c,264 :: 		TRISA =  0b00011111;
	MOVLW      31
	MOVWF      TRISA+0
;BSK_METER.c,265 :: 		ADCON1 = 0b00000100; //A0,A1,A3=ANALOG. A2,A5=DIGITAL;
	MOVLW      4
	MOVWF      ADCON1+0
;BSK_METER.c,266 :: 		ADCON0 = 0b00000000;
	CLRF       ADCON0+0
;BSK_METER.c,271 :: 		GIE_bit = 1;
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;BSK_METER.c,272 :: 		OPTION_REG = 0b00111000; // TOCS=1 for Counter mode, PSA=1 for 1:1
	MOVLW      56
	MOVWF      OPTION_REG+0
;BSK_METER.c,275 :: 		TMR0 = 0;
	CLRF       TMR0+0
;BSK_METER.c,276 :: 		INTCON = 0xA0;
	MOVLW      160
	MOVWF      INTCON+0
;BSK_METER.c,277 :: 		TECO = 0; // Initial Value of Counter
	BCF        RA4_bit+0, BitPos(RA4_bit+0)
;BSK_METER.c,278 :: 		ADC_Init();
	CALL       _ADC_Init+0
;BSK_METER.c,282 :: 		S_DATA=0; K_DATA=0; SPEED_TEMP=0; RAW_ADC=0; ALARM=0;
	CLRF       _S_DATA+0
	CLRF       _S_DATA+1
	CLRF       _K_DATA+0
	CLRF       _K_DATA+1
	CLRF       _SPEED_TEMP+0
	CLRF       _SPEED_TEMP+1
	CLRF       _RAW_ADC+0
	CLRF       _RAW_ADC+1
	BCF        RA5_bit+0, BitPos(RA5_bit+0)
;BSK_METER.c,284 :: 		do {
L_main33:
;BSK_METER.c,285 :: 		RAW_ADC= ADC_Read(0)*2;
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _RAW_ADC+0
	MOVF       R0+1, 0
	MOVWF      _RAW_ADC+1
	RLF        _RAW_ADC+0, 1
	RLF        _RAW_ADC+1, 1
	BCF        _RAW_ADC+0, 0
;BSK_METER.c,286 :: 		LOGIC_();
	CALL       _LOGIC_+0
;BSK_METER.c,287 :: 		if(DVM_EN==0){ DVM();}  //RA2 PIN 4
	BTFSC      RA2_bit+0, BitPos(RA2_bit+0)
	GOTO       L_main36
	CALL       _DVM+0
L_main36:
;BSK_METER.c,288 :: 		if(DVM_EN==1){ BATT_HAR();}
	BTFSS      RA2_bit+0, BitPos(RA2_bit+0)
	GOTO       L_main37
	CALL       _BATT_HAR+0
L_main37:
;BSK_METER.c,289 :: 		SPEED();
	CALL       _SPEED+0
;BSK_METER.c,290 :: 		KILO();
	CALL       _KILO+0
;BSK_METER.c,291 :: 		} while(1);
	GOTO       L_main33
;BSK_METER.c,294 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
