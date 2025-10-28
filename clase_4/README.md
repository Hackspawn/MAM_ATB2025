# Clase #4
### Comunicación Serial: UART, I2C y SPI / MIDI, OSC

Este documento resume de forma clara y práctica los tres protocolos de comunicación serial más comunes en electrónica y microcontroladores: **UART**, **I2C** y **SPI**.

---

## UART (Universal Asynchronous Receiver-Transmitter)

### ✅ Características principales:

* Tipo: **Asíncrono** (no usa reloj compartido)
* Cables: **2** (TX, RX)
* Comunicación: punto a punto (entre 2 dispositivos)
* Requiere que ambos dispositivos acuerden una **velocidad (baud rate)**

### 📄 Ejemplo típico:

* Arduino se comunica con un módulo Bluetooth o un PC por USB

### 🔄 Bits usados:

* Start bit
* Datos (normalmente 8 bits)
* Parity bit (opcional)
* Stop bit

### 🚡 Ventajas:

* Sencillo y ampliamente soportado
* No necesita reloj externo

### ❌ Desventajas:

* Solo 2 dispositivos por canal
* Requiere sincronización precisa (baud rate)

---

## I2C (Inter-Integrated Circuit)

### ✅ Características principales:

* Tipo: **Síncrono** (usa reloj compartido)
* Cables: **2** (SDA, SCL)
* Permite conectar **múltiples dispositivos** en el mismo bus
* Cada esclavo tiene una **dirección única** (por ejemplo, `0x3C`)

### 📄 Ejemplo típico:

* Un Arduino conectado a varios sensores I2C (MPU6050, OLED, BMP280, etc.)

### 🌀 Pueden coexistir varios esclavos, solo un maestro

### 🚡 Ventajas:

* Solo 2 cables para muchos dispositivos
* Facilidad de expansión

### ❌ Desventajas:

* Más lento que SPI
* Puede tener interferencias en cables largos

---

## SPI (Serial Peripheral Interface)

### ✅ Características principales:

* Tipo: **Síncrono** (usa reloj compartido)
* Cables: **4** (MOSI, MISO, SCK, SS)
* Comunicación full duplex (envío y recepción simultáneos)
* Requiere una línea SS (Slave Select) por cada esclavo

### 📄 Ejemplo típico:

* Pantallas TFT, tarjetas SD, memorias Flash

### 🚡 Ventajas:

* Muy rápido y estable
* Ideal para transferencia de datos grandes

### ❌ Desventajas:

* Más cables que I2C
* No tiene direccionamiento, cada esclavo necesita una SS dedicada

---

## Comparación rápida

| Característica       | UART       | I2C                | SPI                     |
| -------------------- | ---------- | ------------------ | ----------------------- |
| Tipo de comunicación | Asíncrona  | Síncrona           | Síncrona                |
| Cables necesarios    | 2 (TX, RX) | 2 (SDA, SCL)       | 4 (MOSI, MISO, SCK, SS) |
| Direccionamiento     | No         | Sí (por dirección) | No (SS dedicado)        |
| Velocidad            | Media      | Media              | Alta                    |
| Complejidad          | Baja       | Media              | Media-Alta              |
| Nº de dispositivos   | 2          | Muchos             | Varios (con SS)         |

---

## Glosario de términos

* **TX**: Transmitir (salida de datos)
* **RX**: Recibir (entrada de datos)
* **SDA**: Serial Data (datos en I2C)
* **SCL**: Serial Clock (reloj en I2C)
* **MOSI**: Master Out Slave In (salida del maestro en SPI)
* **MISO**: Master In Slave Out (salida del esclavo en SPI)
* **SCK**: Serial Clock (reloj en SPI)
* **SS / CS**: Slave Select / Chip Select

---

## Consejos prácticos para identificar sensores:

* Si ves pines **SDA** y **SCL**: es I2C.
* Si ves **MOSI, MISO, SCK, CS**: es SPI.
* Si ves solo **TX y RX**: es UART.
* Busca en el datasheet o el nombre del protocolo en la descripción del producto ("I2C interface", "SPI compatible", etc.).

