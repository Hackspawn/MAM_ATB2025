# Arduino + Processing: Control de Opacidad con Sensor de Distancia

Este proyecto conecta un sensor de distancia **Sharp GP2Y0A21, GP2Y0A02 o GP2Y0A710** (u otro) a un **Arduino**, y visualiza la lectura en **Processing** controlando la **opacidad de una imagen** según la cercanía de un objeto al sensor.

---

## 🧰 Materiales necesarios

- Arduino UNO, Nano o compatible
- Sensor de distancia Sharp (GP2Y0A21 / GP2Y0A02 / GP2Y0A710)
- Cables de conexión
- Cable USB
- Imagen `foto.jpg` colocada en la carpeta del sketch de Processing
- IDE de Arduino y Processing

---

## 🔌 Esquema de conexión del sensor Sharp

| Sensor Sharp | Arduino |
|--------------|---------|
| VCC          | 5V      |
| GND          | GND     |
| OUT          | A0      |

---

## Código Arduino (envía valor mapeado)

```cpp
void setup() {
  Serial.begin(9600);
}

void loop() {
  int raw = analogRead(A0);               // Lectura del sensor
  int mappedValue = map(raw, 0, 1023, 0, 100); // Mapeo a opacidad 0–100
  Serial.println(mappedValue);            // Envío del valor
  delay(50);                              // Pequeño retardo
}
