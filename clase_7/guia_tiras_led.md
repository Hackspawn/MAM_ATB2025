# Guía de Tiras LED Direccionables (WS2812B, WS2811, SK6812, NeoPixel, etc.)

Las tiras LED direccionables permiten controlar cada LED de forma
independiente mediante un protocolo digital. Esta guía explica conceptos
esenciales para su uso seguro y correcto.

## 📌 Voltaje de funcionamiento (5V -- 12V)

### ⭐ 5V (WS2812B / SK6812 / NeoPixel)

-   Comunes en proyectos con Arduino y ESP32.
-   LEDs y controlador integrados.
-   Mayor consumo por metro.

### ⭐ 12V (WS2811 / WS2815)

-   Menor caída de tensión en tiras largas.
-   WS2811 suele agrupar **3 LEDs por píxel**.

## 📌 Entradas y salidas: DI (DIN) y DO (DOUT)

    Microcontrolador → DIN → LED1 → LED2 → ... → DO

Conectar siempre siguiendo la flecha en la tira.

## ✂️ Dónde cortar

Solo en los puntos marcados con ✂️:

    [LED] --✂-- [LED] --✂-- [LED]

## 📏 Medidas: LEDs por metro

  Modelo     Voltaje   LEDs/Metro        Notas
  ---------- --------- ----------------- ------------------
  WS2812B    5V        30 / 60 / 144     Muy común
  NeoPixel   5V        30 / 60 / 144     Calidad Adafruit
  SK6812     5V        30 / 60 / 144     RGBW
  WS2811     12V       \~10-12 píxeles   3 LEDs/píxel
  WS2815     12V       30/60             Señal redundante

## ⚡ Alimentación y Tierra común

-   NO alimentar la tira desde Arduino/ESP32.
-   La tira requiere fuente externa.
-   **Compartir GND** entre tira, fuente y microcontrolador.

```{=html}
<!-- -->
```
    +5V/12V → Fuente → Tira LED
    GND ----┬--------→ Tira LED
            └--------→ Arduino/ESP32

## 🔵 Apunte sobre NeoPixel

NeoPixel es la marca de Adafruit basada en WS2812B o SK6812.

### Diferencias

-   Mayor control de calidad.
-   Documentación y librería oficial **Adafruit NeoPixel**.

### Compatibilidad

  Tipo          Compatible
  ------------- ------------
  WS2812B       ✔
  SK6812 RGBW   ✔
  WS2811        ✖
  WS2815        ✖

## 🔧 Ejemplo ESP32 + Tira 5V

    ESP32 GPIO → 330Ω → DIN
    GND ESP32 → GND común
    Fuente 5V → +5V de la tira

Recomendado: resistencia 330--470Ω y capacitor 1000 µF.

## ⚡ Cálculo de Fuente de Poder para Tiras LED WS2812B

Cuando trabajas con tiras LED direccionables WS2812B, es importante calcular correctamente la fuente de alimentación y planificar la **inyección de energía** para evitar problemas de caída de voltaje.

---

### 🔢 Fórmula general para calcular cantidad máxima de LEDs:

Cada LED puede consumir hasta **60 mA** a brillo máximo (RGB: blanco total).

```math
Cantidad_de_LEDs = (Amperaje_fuente / 0.06) × 0.8

