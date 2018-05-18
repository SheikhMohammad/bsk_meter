/*
        ;Program        :BSK_METER.C
        ;written By     :Sheikh Mohammad
        ;Date           :21 SEPTEMBER 2014
        ;PIC            :16f72
        ;Oscillator     :4.00 MHZ
        ;Watchdog       :off
        ;function       :BATTERY % , SPEED, KILOMETER, FOR 48V BATTERY DRIVEN RICKSHAW
        ;Contact        :emilon@gmail.com, SMS:+8801711686161
        ;Location       : Bogra
*/
//Standerd 12V battery charging Voltage
// 12.70v= 100%
// 12.50v= 90%
// 12.40v= 80%
// 12.30v= 70%
// 12.20v= 60%
// 12.05v= 50%
// 11.90v= 40%
// 11.75v= 30%
// 11.55v= 20%
// 11.30v= 10%
// 10.50v= 0%


// Define digit selection port pins
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


//unsigned short i,BBD1,BBD2,SSD1,SSD2,SSD3,KKD1,KKD2,KKD3,RAW_ADC,S_DATA,K_DATA;
unsigned int i,HAR,BBD1,BBD2,SSD1,SSD2,SSD3,KKD1,KKD2,KKD3,RAW_ADC,S_DATA,K_DATA, SPEED_TEMP;

long DisplayVolt;

//-- Function to Return mask for common cathode 7-seg. display
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
  } //case end --------abcdefg
}

//======================== DISPLAY ===========================
void Display_Data()
{
   for (i = 0; i<=120; i++)  // DATA TOTAL DELAY= 8ms X 120 = 960ms
   {
      //-------------BB2---------
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
      //--------------BB1--------
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
      //--------------SS3--------
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
      //--------------SS2---------
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
      //--------------SS1---------
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
      //----------------KK3-----------
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
      //----------------KK2----------
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
      //-----------------KK1---------------
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
      //-----------------
   }
 }
//===================  LOGIC ================================
void LOGIC_()
{
                 if (RAW_ADC<=40) {ALARM=1; delay_ms(1000); ALARM=0;}
}
//======================== DVM ===========================
void DVM()
{
  DisplayVolt = RAW_ADC;
  BBD1 = (DisplayVolt/1)%10;  // Extract DD1
  BBD1 = mask(BBD1);
  BBD2 = (DisplayVolt/10)%10;
  BBD2 = mask(BBD2);
  Display_Data();
}
//==========================BATT % =========================
void BATT_HAR()
{
     if(RAW_ADC<=41) // BATT LOW = 41V
     {
     BBD2=0b01110001;
     BBD1=0b01100010;
     Display_Data();

     }

     if(RAW_ADC>=52) //BATT FULL = 52V
     {
     BBD2=0b00111000;
     BBD1=0b01110001;
     Display_Data();
     }

     if ((RAW_ADC>=42)&&(RAW_ADC<=51))
     {
  HAR = (RAW_ADC-42)*11.1; //51-42=9, 11.1X9=99.9%
  BBD1 = (HAR/1)%10;  // Extract DD1
  BBD1 = mask(BBD1);
  BBD2 = (HAR/10)%10;
  BBD2 = mask(BBD2);
  Display_Data();
       }
}

//================================SPEED ===========================
// WHEEL RADIUS IS 2.25 METER IT MEANS 4=10 METER, 40=100 METER, 400=1KM
// 3600 SEC GOES 1000 METER; 1 SEC GOES 1000/3600= 0.27777777777777777777777777777778 METER
void SPEED(){
  
  SPEED_TEMP= SPEED_TEMP+ TMR0*2.25; // DISTANCE IN EVERY SEC
  if(SPEED_TEMP>=1000){SPEED_TEMP=0; K_DATA++;}
  
  S_DATA= TMR0*2.25*1.2;  //TMR0*2.25*3600/1000/8. THERE IS 3 DISPLAY DELAY 3 SEC
//  S_DATA= TMR0*2.25;  // METER/SEC
//  S_DATA= S_DATA*3600; //  METER/HOUR
//  S_DATA= S_DATA/1000; // KILOMETER/HOUR

  TMR0 = 0;


  SSD1 = (S_DATA/1)%10;  // Extract DD1
  SSD1 = mask(SSD1);
  SSD2 = (S_DATA/10)%10;
  SSD2 = mask(SSD2);
  SSD3 = (S_DATA/100)%10;
  SSD3 = mask(SSD3);

  Display_Data();
  //TMR0 = 0;
 }

//=============================== KILOMETER =========================
void KILO(){
  KKD1 = (K_DATA/1)%10;  // Extract DD1
  KKD1 = mask(KKD1);
  KKD2 = (K_DATA/10)%10;
  KKD2 = mask(KKD2);
  KKD3 = (K_DATA/100)%10;
  KKD3 = mask(KKD3);

  Display_Data();
 }
//===============================

unsigned Get_ADC(){
   ADCON0.GO_NOT_DONE = 1;     // start conversion
   while (ADCON0.GO_NOT_DONE); // wait for conversion
   return ADRES*2; // return value 256X2=512
}

//XXXXXXXXXXXXXXXXXXXXXXXXXXX MAIN PROGRAM XXXXXXXXXXXXXXXXXXXXXXXXXXX
void main() {
        TRISB = 0x0; // ALL PINS R OUTPUT
        TRISC = 0x0; //ALL PINS R OUTPUT
        TRISA =  0b00011111;
        ADCON1 = 0b00000100; //A0,A1,A3=ANALOG. A2,A5=DIGITAL;
        ADCON0 = 0b00000000;
//Timer0
//Prescaler 1:256; TMR0 Preload = 58; Actual Interrupt Time : 9.9844 ms
//Place/Copy this part in declaration section

        GIE_bit = 1;
        OPTION_REG = 0b00111000; // TOCS=1 for Counter mode, PSA=1 for 1:1
        //OPTION_REG = 0x87;
        //T0CS = 1; //TMR0 SOURCE FROM RA4  PIN-6
        TMR0 = 0;
        INTCON = 0xA0;
        TECO = 0; // Initial Value of Counter
        ADC_Init();
        
 // BBD2=1; BBD1=2; SSD3=3; SSD2=4; SSD1=5; KKD3=6; KKD2=7; KKD1=8;
// DisplayVolt=12; 
   S_DATA=0; K_DATA=0; SPEED_TEMP=0; RAW_ADC=0; ALARM=0;
//  Display_Data();
 do {
    RAW_ADC= ADC_Read(0)*2;
    LOGIC_();
    if(DVM_EN==0){ DVM();}  //RA2 PIN 4
    if(DVM_EN==1){ BATT_HAR();}
    SPEED();
    KILO();
    } while(1);


}