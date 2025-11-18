# Secuencia de Imágenes Controlada por Arduino + Processing

Este proyecto permite reproducir una secuencia de imágenes en **Processing**, donde cada imagen es un **frame**.
El número de frame o la velocidad de reproducción pueden ser controlados desde **Arduino** usando un potenciómetro mediante comunicación **Serial**.
Opcionalmente, el control puede hacerse por **OSC** usando un ESP8266/ESP32.

---

## ✨ Características

- Control preciso del **frame actual** usando un potenciómetro.
- Reproducción fluida de secuencias de imágenes ordenadas.
- Posibilidad de controlar la **velocidad** o incluso reproducción hacia atrás.
- Comunicación por **Serial (Arduino)** o **OSC (WiFi)**.
- Ideal para instalaciones interactivas, video arte, performances o interfaces físicas.

---

## 🧱 Requisitos

### Hardware
- Arduino UNO / Nano / Leonardo / Mega
- Potenciómetro de 10k
- Cable USB

### Software
- Processing (última versión)
- Arduino IDE
- Librería Serial incluida en Processing
- (Opcional) Librería `oscP5` para OSC

---

## 📁 Estructura de proyecto

```
/tu-proyecto/
│
├── processing/
│   ├── sketch.pde
│   └── data/
│       └── frames/
│           ├── frame_0001.png
│           ├── frame_0002.png
│           ├── frame_0003.png
│           └── ...
└── arduino/
    └── arduino_serial_control.ino
```

---

## 🔌 Conexión del potenciómetro a Arduino

```
Potenciómetro
 ├── Pin 1  →  5V
 ├── Pin 2  →  A0
 └── Pin 3  →  GND
```

---

## 🟦 Código Arduino (Serial)

```cpp
int potPin = A0;

void setup() {
  Serial.begin(115200);
}

void loop() {
  int val = analogRead(potPin); // 0–1023
  Serial.println(val);
  delay(10);
}
```

---

## 🟧 Código Processing (selección de frame)

```java
import processing.serial.*;
import java.io.File;
import java.util.Arrays;
import java.util.Comparator;

Serial myPort;

PImage[] frames;
int totalFrames;
int currentFrame = 0;

void setup() {
  size(800, 600);
  surface.setTitle("Secuencia controlada por Arduino");

  println(Serial.list());
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 115200);
  myPort.bufferUntil('\n');

  File folder = new File(dataPath("frames"));
  File[] files = folder.listFiles();

  files = Arrays.stream(files)
    .filter(f -> f.getName().toLowerCase().matches(".*\\.(png|jpg|jpeg|gif)$"))
    .sorted(Comparator.comparing(File::getName))
    .toArray(File[]::new);

  totalFrames = files.length;

  frames = new PImage[totalFrames];
  for (int i = 0; i < totalFrames; i++) {
    frames[i] = loadImage("frames/" + files[i].getName());
  }
}

void draw() {
  background(0);

  if (frames != null && frames.length > 0) {
    image(frames[currentFrame], 0, 0, width, height);
  }

  fill(255);
  text("Frame: " + currentFrame + " / " + (totalFrames - 1), 10, height - 20);
}

void serialEvent(Serial p) {
  String in = p.readStringUntil('\n');
  if (in != null) {
    in = trim(in);
    if (in.length() > 0) {
      int sensor;
      try {
        sensor = int(in);
      } catch (Exception e) {
        return;
      }

      int index = int(map(sensor, 0, 1023, 0, totalFrames - 1));
      index = constrain(index, 0, totalFrames - 1);
      currentFrame = index;
    }
  }
}
```

---

