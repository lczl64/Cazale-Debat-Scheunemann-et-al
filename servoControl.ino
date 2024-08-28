
/* ----------------------------------------------
*              PREPROCESSOR DIRECTIVES
 * ---------------------------------------------- */
#include <Servo.h>
#include <stdint.h>

#define FREQUENCY_ENABLED 1
/* ----------------------------------------------
 *                 GLOBAL VARIABLES
 * ---------------------------------------------- */
Servo myservo;  // create servo object to control a servo
// twelve servo objects can be created on most boards

int16_t pos = 0;            // variable to store the servo position
uint32_t speed = 6;
float floatSpeed = 0;
uint8_t cycles = 0;
uint8_t quit;
float frequency = 0.0;

typedef enum {
  standby,
  running
}state_t;

state_t state = standby;

/* ----------------------------------------------
 *              FUNCTION PROTOTYPES
 * ---------------------------------------------- */
void getFrequency(void);
void getSpeed(void);

/* ----------------------------------------------
 *                 INITIALISATION
 * ---------------------------------------------- */
void setup() 
{
    // attaches the servo on pin 9 to the servo object
    myservo.attach(9);  
  
    // opens serial port, sets data rate to 9600 bps
    Serial.begin(9600); 

    Serial.print("\n\n\n\n\n\n\n");
    Serial.print("********** APPLICATION STARTING ********** ");
    Serial.print("\n\n\n\n\n\n\n");

}

/* ----------------------------------------------
 *                 MAIN LOOP
 * ---------------------------------------------- */
void loop() 
{
    static uint8_t count = 1;
  
    switch(state)
    {  
        /* --------------------------------------------------------------------------------
         * In standby mode we need to prompt the user and wait indefinitely for their input. 
         * --------------------------------------------------------------------------------*/
        case standby:
        
#if FREQUENCY_ENABLED
            getFrequency();
#else
            getSpeed();
#endif
            state = running;
            break;

        /* ---------------------------------------------------------------------------------------
         * In running mode the device is executing the programmed sequence. 
         * We exit this mode either if the sequence finishes or the user types 'Q' or 'q' to quit 
         * ---------------------------------------------------------------------------------------*/
        case running:
            for (pos = 0; pos <= 180; pos += 1)         // goes from 0 degrees to 180 degrees in steps of 1 degree
            {  
                myservo.write(pos);                     // tell servo to go to position in variable 'pos'
//                delay(speed);                         // delay to control rotational speed
                delayMicroseconds(speed);
            }
            for (pos = 180; pos >= 0; pos -= 1)         // goes from 180 degrees to 0 degrees
            {  
                myservo.write(pos);                     // tell servo to go to position in variable 'pos'
//                delay(speed);                         // delay to control rotational speed
                delayMicroseconds(speed);
            }

            if (Serial.available() > 0) 
            {
                quit = Serial.read();
                Serial.print("\n");
                if (quit == 'q' || quit == 'Q')
                {
                    count = 0;
                    state = standby;
                }
            }
            
            if (  count >= cycles )
            {
                count = 0;
                state = standby;
            }

            count++;
            break;

        default:
            state = standby;
            break;
    }
    
}


#ifdef FREQUENCY_ENABLED

void getFrequency(void){
    Serial.flush();
    
    Serial.print("\nfrequency: ");
    while(Serial.available() == 0);
    frequency = Serial.parseFloat();
    Serial.print(frequency);
    
    Serial.flush();
    
    Serial.print("\nNumber of Cycles: ");
    while(Serial.available() == 0);
    cycles = Serial.parseInt();
    Serial.print(cycles);
    
    Serial.println("\n\nExecutig servo sequence. Press Q to quit...");

    //Now that we have frequency, we need to calculate the speed of the paddle using f=1/T

    floatSpeed =((1/frequency)/360)*1000000; 
    speed = (uint32_t)floatSpeed;

    Serial.print("\nTime delay in microseconds: ");
    Serial.print(speed);
}

#else

void getSpeed(void){
    Serial.flush();
    
    Serial.print("\nServo speed: ");
    while(Serial.available() == 0);
    //            speed = Serial.read() - '0';
    speed = Serial.parseInt();
    Serial.print(speed);
    
    Serial.flush();
    
    Serial.print("\nNumber of Cycles: ");
    while(Serial.available() == 0);
    //            cycles = Serial.read() - '0';
    cycles = Serial.parseInt();
    Serial.print(cycles);
    
    Serial.println("\n\nExecutig servo sequence. Press Q to quit...");
    state = running;
}

#endif
