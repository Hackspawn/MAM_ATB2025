# Clase 2 — Controladores MIDI con Arduino (USB-MIDI + Sonic Pi)

## 🎯 Objetivos de la clase
- Comprender qué es **MIDI** y las diferencias entre **MIDI por USB** y **MIDI DIN (5 pines)**.  
- Configurar el entorno para enviar **notas** y **control changes (CC)** mediante USB-MIDI.  
- Construir un **controlador mínimo** (1 botón o 1 potenciómetro o 1 sensor de distancia) que controle un sintetizador en Sonic Pi.  
- Analizar qué **placas Arduino** son más adecuadas para trabajar con MIDI por USB.

---

## 🧰 Requisitos previos
- **Arduino IDE** (versión 2.3 o superior).  
- **Sonic Pi** o un DAW que reciba mensajes MIDI (Ableton Live, Reaper, Logic, etc.).  
- Conocimientos básicos de electrónica: entradas digitales, analógicas y resistencias *pull-up*.

---

## 🧩 Materiales
- 1 botón (pulsador) *(opcional)*
- 1 potenciómetro de 10kΩ *(opcional)*  
- Jumpers, resistencias, protoboard  
- **Placa con USB nativo** recomendada:  
  *Arduino Leonardo / Micro / Pro Micro*, *Zero*, *MKR Zero*, *Due*, *Nano 33 IoT* o *BLE*

> 💡 **Nota:** Arduino UNO R3 no tiene USB nativo.  
> Puede funcionar mediante **HIDUINO** (flasheando el chip 16U2) o con el software **Hairless MIDI<->Serial Bridge**,  
> pero no es la opción más sencilla para principiantes.  
> El **UNO R4** todavía no cuenta con soporte estable para MIDIUSB directo.

---

## 🧠 1. Instalación y librerías

### Opción A — Librería `MIDIUSB` (oficial y directa)
- Instala desde *Library Manager* → **MIDIUSB**  
- Compatible con placas con USB nativo (Leonardo, Micro, Zero, MKR, Due)

### Opción B — Librería `Control Surface` (más intuitiva)
- Instala desde *Library Manager* → **Control Surface** (de tttapa)  
- Simplifica el uso de entradas, potenciómetros, botones, etc.

> Si usas **UNO R3** o una placa sin USB nativo, instala **Hairless MIDI<->Serial Bridge** en tu computadora.  
> Este programa “traduce” los mensajes Serial a MIDI.

---

## 🧮 2. Ejemplo 1: Envío de notas MIDI con `MIDIUSB`

```cpp
#include "MIDIUSB.h"

void noteOn(byte channel, byte note, byte velocity) {
  midiEventPacket_t noteOn = {0x09, (byte)(0x90 | (channel & 0x0F)), note, velocity};
  MidiUSB.sendMIDI(noteOn);
  MidiUSB.flush();
}

void noteOff(byte channel, byte note, byte velocity) {
  midiEventPacket_t noteOff = {0x08, (byte)(0x80 | (channel & 0x0F)), note, velocity};
  MidiUSB.sendMIDI(noteOff);
  MidiUSB.flush();
}

const int BUTTON = 2;
const byte CHANNEL = 0;
const byte NOTE = 60; // C3
bool pressed = false;

void setup() {
  pinMode(BUTTON, INPUT_PULLUP);
}

void loop() {
  bool now = digitalRead(BUTTON) == LOW;
  if (now && !pressed) {
    noteOn(CHANNEL, NOTE, 100);
    pressed = true;
  }
  if (!now && pressed) {
    noteOff(CHANNEL, NOTE, 0);
    pressed = false;
  }
}
