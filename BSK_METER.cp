#line 1 "C:/data_SK_MD/SKMD_Project/SKMD_Projects/BOGRA_PROJECTS/GABTOLI_/BSK_METER_1/BSK_METER.c"
#line 27 "C:/data_SK_MD/SKMD_Project/SKMD_Projects/BOGRA_PROJECTS/GABTOLI_/BSK_METER_1/BSK_METER.c"
sbit DG1 at RA1_bit;

sbit BB2 at RC0_bit;
sbit BB1 at RC1_bit;

sbit SS3 at RC2_bit;
sbit SS2 at RC3_bit;
sbit SS1 at RC4_bit;

sbit KK3 at RC5_bit;
sbit KK2 at RC6_bit;
sbit KK1 at RC7_bit;

sbit TECO at RA4_bit;
sbit ALARM at RA5_bit;
sbit DVM_EN at RA2_bit;



unsigned int i,HAR,BBD1,BBD2,SSD1,SSD2,SSD3,KKD1,KKD2,KKD3,RAW_ADC,S_DATA,K_DATA, SPEED_TEMP;

long DisplayVolt;


unsigned short mask(unsigned short num) {
 switch (num) {
 case 0 : return 0b00000001;
 case 1 : return 0b01001111;
 case 2 : return 0b00010010;
 case 3 : return 0b00000110;
 case 4 : return 0b01001100;
 case 5 : return 0b00100100;
 case 6 : return 0b00100000;
 case 7 : return 0b00001111;
 case 8 : return 0b00000000;
 case 9 : return 0b00000100;
 }
}


void Display_Data()
{
 for (i = 0; i<=120; i++)
 {

 BB2 = 1;
 BB1 = 0;
 SS3 = 0;
 SS2 = 0;
 SS1 = 0;
 KK3 = 0;
 KK2 = 0;
 KK1 = 0;
 PORTB = BBD2;
 delay_ms(1);
 PORTB = 0b11111111;

 BB2 = 0;
 BB1 = 1;
 SS3 = 0;
 SS2 = 0;
 SS1 = 0;
 KK3 = 0;
 KK2 = 0;
 KK1 = 0;
 PORTB = BBD1;
 delay_ms(1);
 PORTB = 0b11111111;

 BB2 = 0;
 BB1 = 0;
 SS3 = 1;
 SS2 = 0;
 SS1 = 0;
 KK3 = 0;
 KK2 = 0;
 KK1 = 0;
 PORTB = SSD3;
 delay_ms(1);
 PORTB = 0b11111111;

 BB2 = 0;
 BB1 = 0;
 SS3 = 0;
 SS2 = 1;
 SS1 = 0;
 KK3 = 0;
 KK2 = 0;
 KK1 = 0;
 PORTB = SSD2;
 delay_ms(1);
 PORTB = 0b11111111;

 BB2 = 0;
 BB1 = 0;
 SS3 = 0;
 SS2 = 0;
 SS1 = 1;
 KK3 = 0;
 KK2 = 0;
 KK1 = 0;
 PORTB = SSD1;
 delay_ms(1);
 PORTB = 0b11111111;

 BB2 = 0;
 BB1 = 0;
 SS3 = 0;
 SS2 = 0;
 SS1 = 0;
 KK3 = 1;
 KK2 = 0;
 KK1 = 0;
 PORTB = KKD3;
 delay_ms(1);
 PORTB = 0b11111111;

 BB2 = 0;
 BB1 = 0;
 SS3 = 0;
 SS2 = 0;
 SS1 = 0;
 KK3 = 0;
 KK2 = 1;
 KK1 = 0;
 PORTB = KKD2;
 delay_ms(1);
 PORTB = 0b11111111;

 BB2 = 0;
 BB1 = 0;
 SS3 = 0;
 SS2 = 0;
 SS1 = 0;
 KK3 = 0;
 KK2 = 0;
 KK1 = 1;
 PORTB = KKD1;
 delay_ms(1);
 PORTB = 0b11111111;

 }
 }

void LOGIC_()
{
 if (RAW_ADC<=40) {ALARM=1; delay_ms(1000); ALARM=0;}
}

void DVM()
{
 DisplayVolt = RAW_ADC;
 BBD1 = (DisplayVolt/1)%10;
 BBD1 = mask(BBD1);
 BBD2 = (DisplayVolt/10)%10;
 BBD2 = mask(BBD2);
 Display_Data();
}

void BATT_HAR()
{
 if(RAW_ADC<=41)
 {
 BBD2=0b01110001;
 BBD1=0b01100010;
 Display_Data();

 }

 if(RAW_ADC>=52)
 {
 BBD2=0b00111000;
 BBD1=0b01110001;
 Display_Data();
 }

 if ((RAW_ADC>=42)&&(RAW_ADC<=51))
 {
 HAR = (RAW_ADC-42)*11.1;
 BBD1 = (HAR/1)%10;
 BBD1 = mask(BBD1);
 BBD2 = (HAR/10)%10;
 BBD2 = mask(BBD2);
 Display_Data();
 }
}




void SPEED(){

 SPEED_TEMP= SPEED_TEMP+ TMR0*2.25;
 if(SPEED_TEMP>=1000){SPEED_TEMP=0; K_DATA++;}

 S_DATA= TMR0*2.25*1.2;




 TMR0 = 0;


 SSD1 = (S_DATA/1)%10;
 SSD1 = mask(SSD1);
 SSD2 = (S_DATA/10)%10;
 SSD2 = mask(SSD2);
 SSD3 = (S_DATA/100)%10;
 SSD3 = mask(SSD3);

 Display_Data();

 }


void KILO(){
 KKD1 = (K_DATA/1)%10;
 KKD1 = mask(KKD1);
 KKD2 = (K_DATA/10)%10;
 KKD2 = mask(KKD2);
 KKD3 = (K_DATA/100)%10;
 KKD3 = mask(KKD3);

 Display_Data();
 }


unsigned Get_ADC(){
 ADCON0.GO_NOT_DONE = 1;
 while (ADCON0.GO_NOT_DONE);
 return ADRES*2;
}


void main() {
 TRISB = 0x0;
 TRISC = 0x0;
 TRISA = 0b00011111;
 ADCON1 = 0b00000100;
 ADCON0 = 0b00000000;




 GIE_bit = 1;
 OPTION_REG = 0b00111000;


 TMR0 = 0;
 INTCON = 0xA0;
 TECO = 0;
 ADC_Init();



 S_DATA=0; K_DATA=0; SPEED_TEMP=0; RAW_ADC=0; ALARM=0;

 do {
 RAW_ADC= ADC_Read(0)*2;
 LOGIC_();
 if(DVM_EN==0){ DVM();}
 if(DVM_EN==1){ BATT_HAR();}
 SPEED();
 KILO();
 } while(1);


}
