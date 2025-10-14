### Clase 2: Controladores MIDI con Arduino y Sonic Pi
---

## 🎯 Objetivos de la clase
- Comprender el funcionamiento del protocolo **MIDI** y su relación con **Sonic Pi** y **Arduino**.  
- Aprender a **programar secuencias musicales** mediante listas de notas en Sonic Pi.  
- Construir un **controlador físico** con Arduino que envíe mensajes MIDI vía USB.  
- Experimentar con sensores y actuadores para generar control musical en tiempo real.

---

## 🧠 Contenidos de la clase
0. Revisión **tarea semáforo**.
1. **Ejemplo 1 – Sonic Pi:** secuencia de notas MIDI en Ruby.  
2. **Arduino:** lectura de sensores.  
3. **Comunicación USB-MIDI:** librería `MIDI.h` y compatibilidad entre placas.

---

## 🎹 Ejemplo 1 – Sonic Pi: Lista de notas MIDI y secuencia musical

### Código base
```ruby
use_bpm 220
use_synth :pulse
use_synth_defaults sustain: 0.08, release: 0.12, amp: 1.2

# Lista intercalada [nota_midi, duración_unidades]
notes_and_durations = [
  76, 12, 76, 12, 20, 12, 76, 12, 20, 12, 72, 12, 76, 12, 20, 12,
  79, 12, 20, 36, 67, 12, 20, 36, 72, 12, 20, 24, 67, 12, 20, 24,
  64, 12, 20, 24, 69, 12, 20, 12, 71, 12, 20, 12, 70, 12, 69, 12,
  20, 12, 67, 16, 76, 16, 79, 16, 81, 12, 20, 12, 77, 12, 79, 12,
  20, 12, 76, 12, 20, 12, 72, 12, 74, 12, 71, 12, 20, 24
]

sequence = notes_and_durations.each_slice(2).to_a

define :play_sequence do |seq, factor: 0.07, transpose: 0|
  seq.each do |n, d|
    t = d * factor
    if n == :r
      sleep t
    else
      play n + transpose
      sleep t
    end
  end
end

live_loop :mario_theme do
  play_sequence sequence, factor: 0.07, transpose: 0
end
```

---

## 🔧 Parte 2 – Arduino: sensores y flujo de datos (SHARP GP2Y0A21 o GP2Y0A02)
```cpp
void setup() {
  // Comunicación seria a 9600 baudios
  Serial.begin(9600);
}

void loop() {
  // Leemos la entrada analógica 0 :
  int ADC_SHARP = analogRead(A0);
  Serial.println(ADC_SHARP);
  delay(10);
}
```
---

## 🎛️ Parte 3 – Comunicación USB-MIDI con `MIDIUSB.h`
```ruby
# Welcome to Sonic Pi
live_loop :midi_piano do
  #ren sync recuerden poner la ruta del dispositivo midi en note_on
  note, velocity = sync "/midi:arduino_zero:2/note_on"
  #en synth eligen el sintetizador que desean
  synth :dark_ambience, note: note
end
```
**Importante**... consideren que el *monitor serial* de **arduino** debe quedar libre para mandar los mensajes a otro programa.
Eso se traduce en cerrar el **arduino IDE**.

```cpp
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
```

---

## ⚙️ Tabla de compatibilidad de placas Arduino para USB-MIDI

| Placa | MCU | USB nativo | ¿MIDIUSB directo? | Librería típica | Dificultad | Comentarios |
|-------|-----|-------------|------------------|----------------|-------------|--------------|
| **Leonardo / Micro / Pro Micro** | ATmega32u4 | ✅ | ✅ | MIDIUSB / Control Surface | 🔹 Baja | Ideal para comenzar. |
| **Zero** | SAMD21 | ✅ | ✅ | MIDIUSB / Control Surface | 🔹 Baja | 32 bits, estable. |
| **MKR Zero / MKR1000** | SAMD21 | ✅ | ✅ | MIDIUSB / Control Surface | 🔹 Baja | Ideal para proyectos con SD. |
| **Nano 33 IoT / BLE** | SAMD21 / nRF52840 | ✅ | ✅ | Control Surface | 🔸 Media | Compatible con BLE-MIDI. |
| **Due** | SAM3X8E | ✅ | ✅ | MIDIUSB / Control Surface | 🔸 Media | 3.3 V. |
| **UNO R4 (Minima / WiFi)** | Renesas RA4M1 | ✅ | ⚠️ Parcial | (Solo Serial MIDI) | 🔸 Media | Ecosistema en desarrollo. |
| **UNO R3** | ATmega328P + 16U2 | ❌ | ❌ | — | 🔴 Alta | Requiere HIDUINO o Hairless MIDI Bridge. |
| **Arduino 101** | Intel Curie | ✅ | ⚠️ Parcial | CurieMIDI (experimental) | 🔸 Media | Soporte limitado. |
| **Teensy (extra)** | ARM Cortex-M | ✅ | ✅ | Teensyduino | 🔹 Baja | Excelente compatibilidad. |

---
## 🧪 Actividad práctica
1. Programa tu melodía en Sonic Pi (Ejemplo 1).  
2. Construye un controlador con Arduino (Sensor a elección).  
3. Envía notas vía MIDI USB hacia Sonic Pi.  

---
