#include <SD.h>          // Incluir la librería SD
#include <SPI.h>         // SPI es necesaria para la comunicación con la tarjeta

// Variables del pin TMP36
int sensorPin = 0;        // Pin analógico al que está conectado el TMP36
const int chipSelect = 10; // Pin CS de la tarjeta SD (puede variar según la placa)

File dataFile;

void setup(){
  Serial.begin(9600); 

  // Inicializar la tarjeta SD
  if (!SD.begin(chipSelect)) {
    Serial.println("Error al inicializar la tarjeta SD.");
    return;
  }
  Serial.println("Tarjeta SD inicializada correctamente.");
}

void loop(){
  // Obtener la lectura del sensor
  int reading = analogRead(sensorPin);  

  // Calcular voltaje y temperatura
  float voltage = reading * 5.0 / 1024.0; 
  float temperatureC = (voltage - 0.5) * 100;
  float temperatureF = (temperatureC * 9.0 / 5.0) + 32.0;

  // Mostrar por el monitor serial
  Serial.print(voltage); Serial.println(" volts");
  Serial.print(temperatureC); Serial.println(" grados C");
  Serial.print(temperatureF); Serial.println(" grados F");

  // Abrir archivo para escribir (modo append)
  dataFile = SD.open("data.txt", FILE_WRITE);
  if (dataFile) {
    dataFile.print(voltage); dataFile.print(","); dataFile.print(temperatureC); dataFile.print(","); dataFile.println(temperatureF);
    //dataFile.print("Voltaje: "); dataFile.print(voltage); dataFile.println(" V");
    //dataFile.print("Temp C: "); dataFile.print(temperatureC); dataFile.println(" C");
    //dataFile.print("Temp F: "); dataFile.print(temperatureF); dataFile.println(" F");
    //dataFile.println("---");
    dataFile.close(); // Importante: cerrar el archivo
  } else {
    Serial.println("Error al abrir data.txt");
  }

  delay(1000); // Esperar 1 segundo
}
