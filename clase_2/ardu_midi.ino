#include <MIDI.h>

// Crear una instancia MIDI por defecto (usa Serial a 31250 baudios)
MIDI_CREATE_DEFAULT_INSTANCE();

void setup() {
  Serial.begin(31250);  // Velocidad MIDI estándar
  MIDI.begin(MIDI_CHANNEL_OMNI); // Escucha todos los canales
}

void loop() {
  int ADC_SHARP_A = analogRead(A0);

  // Mapear el valor del sensor a una nota MIDI
  int note = map(ADC_SHARP_A, 0, 1023, 40, 80); // evita extremos como 0 y 127

  // Enviar nota ON
  MIDI.sendNoteOn(note, 64, 1);  // Nota, Velocidad, Canal
  delay(64);

  // Enviar nota OFF
  MIDI.sendNoteOff(note, 64, 1);
  delay(100);
}
