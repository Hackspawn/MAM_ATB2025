# 🎵 Explicación del código — Sonic Pi: Secuencia de notas MIDI (Mario Theme)

Este documento explica paso a paso el funcionamiento del código en Sonic Pi que reproduce una melodía tipo *chiptune* basada en notas MIDI.

---

## 1. Configuración inicial

```ruby
use_bpm 220
use_synth :pulse
use_synth_defaults sustain: 0.08, release: 0.12, amp: 1.2
```

### 🔹 `use_bpm`
Define el **tempo global** del proyecto en *beats per minute* (pulsos por minuto). En este caso, `220` da una velocidad rápida y energética.

### 🔹 `use_synth`
Selecciona el sintetizador. `:pulse` genera una **onda cuadrada**, típica de los sonidos 8-bit.

### 🔹 `use_synth_defaults`
Establece parámetros comunes para todas las notas:
- `sustain`: tiempo en que la nota se mantiene activa.  
- `release`: cuánto tarda en desaparecer el sonido.  
- `amp`: volumen general.

---

## 2. Definición de la lista de notas y duraciones

```ruby
notes_and_durations = [
  76, 12, 76, 12, 20, 12, 76, 12, 20, 12, 72, 12, 76, 12, 20, 12,
  79, 12, 20, 36, 67, 12, 20, 36, 72, 12, 20, 24, 67, 12, 20, 24,
  64, 12, 20, 24, 69, 12, 20, 12, 71, 12, 20, 12, 70, 12, 69, 12,
  20, 12, 67, 16, 76, 16, 79, 16, 81, 12, 20, 12, 77, 12, 79, 12,
  20, 12, 76, 12, 20, 12, 72, 12, 74, 12, 71, 12, 20, 24
]
```

Cada **número** representa una nota MIDI (60 = C4, 72 = C5, etc.), y el número siguiente su **duración relativa**.  
El valor `20` funciona como una pausa o silencio breve.

---

## 3. Conversión en pares de `[nota, duración]`

```ruby
sequence = notes_and_durations.each_slice(2).to_a
```

`each_slice(2)` divide la lista en grupos de dos elementos: `[nota, duración]`.  
Esto permite recorrer la secuencia de manera ordenada.

---

## 4. Definición de la función `play_sequence`

```ruby
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
```

### Explicación:
- `factor` escala la duración total de la melodía (velocidad).  
- `transpose` permite cambiar la tonalidad (por ejemplo, +12 sube una octava).  
- `play n + transpose` ejecuta cada nota MIDI.  
- `sleep t` espera el tiempo correspondiente antes de la siguiente nota.

Si la nota es `:r`, el programa solo espera (pausa).

---

## 5. Ejecución con `live_loop`

```ruby
live_loop :mario_theme do
  play_sequence sequence, factor: 0.07, transpose: 0
end
```

El **`live_loop`** permite repetir la secuencia indefinidamente y modificar parámetros en tiempo real, ideal para presentaciones o improvisación en vivo.

---

## 6. Terminología clave

| Término | Descripción |
|----------|--------------|
| **BPM** | Pulsos por minuto, controla la velocidad global. |
| **Synth** | Tipo de sintetizador utilizado para generar el sonido. |
| **Sustain / Release** | Controlan la duración y el decaimiento de cada nota. |
| **MIDI Note** | Valor numérico estándar (0–127) que representa una nota musical. |
| **Sleep** | Pausa o espera entre eventos musicales. |
| **Live Loop** | Bucle de ejecución continua que puede modificarse en vivo. |
| **Transpose** | Desplaza toda la secuencia en semitonos. |

---

## 7. Extensiones posibles
- Sustituir `20` por `:r` para usar silencios simbólicos.  
- Agregar acompañamiento de percusión sincronizado con `sync :mario_theme`.  
- Enviar las notas por MIDI a un DAW externo con `midi note, velocity:`.  
- Añadir efectos con `with_fx :reverb` o `:echo`.

---
