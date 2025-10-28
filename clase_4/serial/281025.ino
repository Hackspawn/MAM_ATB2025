// Variables del pin TMP36
int sensorPin = 0; 
// El pin analógico al que está conectado el pin Vout (salida) del TMP36
// La resolución es de 10 mV por grado centígrado con un
// desplazamiento de 500 mV para permitir temperaturas negativas

/*
 * setup() - esta función se ejecuta una vez cuando se enciende el Arduino
 * Inicializamos la conexión serial con el computador
 */
void setup(){
  Serial.begin(9600); 
  // Iniciar la conexión serial con el computador
  // Para ver los resultados, abre el monitor serial
}
 
void loop(){
  // Obtener la lectura de voltaje del sensor de temperatura
  int reading = analogRead(sensorPin);  
  // Convertir esa lectura a voltaje; para Arduino de 3.3 V usar 3.3
  float voltage = reading * 5.0;
  voltage /= 1024.0; 
  // Imprimir el voltaje
  Serial.print(voltage); Serial.println(" volts");
  // Ahora imprimir la temperatura en grados Celsius
  float temperatureC = (voltage - 0.5) * 100; // Convertir usando 10 mV por grado con offset de 500 mV
  // Fórmula: ((voltaje - 500 mV) multiplicado por 100)
  Serial.print(temperatureC); Serial.println(" grados C");
  // Ahora convertir a Fahrenheit
  float temperatureF = (temperatureC * 9.0 / 5.0) + 32.0;
  Serial.print(temperatureF); Serial.println(" grados F");
  delay(1000); // Esperar un segundo
}
