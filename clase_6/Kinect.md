# Kinect v1 1414 + Processing + Syphon

Este repositorio incluye un sketch de Processing que permite visualizar una nube de puntos 3D capturada con la **Kinect v1 modelo 1414**, utilizando la librería [OpenKinect for Processing](https://github.com/shiffman/OpenKinect-for-Processing) desarrollada por Daniel Shiffman, y la integración con [Syphon](https://syphon.v002.info/) para compartir la visualización con otras aplicaciones audiovisuales.

---

## 📦 Requisitos

- **Hardware**: Microsoft Kinect v1 modelo 1414  
- **Software**:  
  - Processing 3.x / 4.x
  - Librería `org.openkinect.processing`  
  - Librería `Syphon for Processing`  
  - Drivers de **libfreenect** instalados correctamente

---

## 🎯 Funcionalidades del Sketch

- Captura en tiempo real de profundidad mediante la cámara infrarroja de la Kinect.
- Conversión a nube de puntos 3D usando valores de profundidad calibrados.
- Control de inclinación de la cámara con flechas `↑` y `↓`.
- Visualización en `P3D`, exportada por Syphon a otras plataformas visuales como MadMapper, Resolume, etc.
- Lookup table para mejorar el rendimiento en la conversión de profundidad a metros.

---

## 🎥 ¿Qué es la Kinect 1414?

La **Kinect modelo 1414** fue la primera versión comercializada por Microsoft para Xbox 360. Está compuesta por:

| Componente        | Descripción |
|------------------|-------------|
| **Cámara RGB**   | Sensor de color VGA (640×480 px a 30fps) |
| **Cámara IR**    | Sensor de infrarrojos para profundidad (hasta ~4–5 metros) |
| **Emisor IR**    | Proyector infrarrojo para generar el patrón de profundidad |
| **Micrófonos**   | Matriz de micrófonos para captura de audio direccional |
| **Tilt motor**   | Motor para ajustar la inclinación vertical del dispositivo |

---

## 🧠 ¿Qué es libfreenect?

**libfreenect** es un driver open-source para dispositivos Kinect desarrollado por [OpenKinect](https://openkinect.org/wiki/Main_Page). Permite acceso directo a los sensores del dispositivo sin requerir los drivers de Microsoft.

### Características principales:

- Compatible con Linux, macOS, y Windows
- Permite acceder al stream RGB, IR y de profundidad
- Control del motor de inclinación
- Proyectos derivados incluyen wrappers para Python, Java (Processing), C++, entre otros

La librería `org.openkinect.processing` de Daniel Shiffman es un wrapper de libfreenect para Processing.

---

## 🔄 ¿Qué es Syphon?

**Syphon** es una tecnología para macOS que permite compartir imágenes en tiempo real entre aplicaciones de video, sin necesidad de usar cables o archivos intermedios. Funciona como un servidor y cliente gráfico entre software como:

- **Processing**
- **MadMapper**
- **Resolume Arena**
- **VDMX**
- **TouchDesigner (vía SyphonSpoutBridge)**

En este proyecto, se utiliza:

```java
SyphonServer server = new SyphonServer(this, "Processing Syphon");
server.sendScreen(); // Envía lo que se dibuja en draw()
