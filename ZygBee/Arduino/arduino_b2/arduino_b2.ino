int id = 2;

int pinLight = A1;
int pinTemp = A0;

void setup() {
  Serial.begin(9600); 
  pinMode(INPUT, pinLight);
  pinMode(INPUT, pinTemp);
}

void loop() {
   int valueLight = map(0, 1023, 0, 255, analogRead(pinLight));
   sendFrame(id, pinLight, valueLight);
   
   int valueTemp = map(0, 1023, 0, 255, analogRead(pinTemp));
   sendFrame(id, pinTemp, valueTemp);
  
   delay(1000);
}

int sendFrame(int id, int pin, int value) {
  if(Serial.available()) {
   Serial.write(0X7E); 
   Serial.write(pin);
   Serial.write(value);
  }
}
