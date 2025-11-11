# 🎥 Clase #6  
### 🔧 Syphon (Mac), Raspberry + OpenCV, cables.gl y Kinect  

Durante la clase de hoy exploramos herramientas y librerías que integran **video, visión por computador e interacción en tiempo real**.  
La sesión combinó entornos de desarrollo en **Mac** y **Raspberry Pi**, además de ejercicios prácticos con **Arduino** y **Processing**.  

---

### 🧩 Parte 1 — Syphon (Mac)  
Se revisó el flujo de trabajo con **Syphon**, un sistema de intercambio de video en tiempo real entre aplicaciones en **macOS**.  
Permite enviar y recibir frames de video entre entornos como **Processing**, **VDMX**, **MadMapper** o **TouchDesigner**, facilitando el desarrollo de visuales interactivos.  

📦 Librerías revisadas:  
- [Syphon for Processing](https://github.com/Syphon/Processing)  
- Ejemplos de envío y recepción de texturas entre ventanas y aplicaciones.  

---

### 🧠 Parte 2 — Raspberry Pi + OpenCV  
Configuración de entorno en **Raspberry Pi OS** para trabajar con **OpenCV** y visión por computador.  
Se utilizó un entorno virtual con `venv` y la instalación del paquete extendido:  

```bash
sudo apt install python3-venv
python3 -m venv cvenv
source cvenv/bin/activate
pip install opencv-contrib-python
```

🔍 Librería: [opencv-contrib-python](https://pypi.org/project/opencv-contrib-python/)  
Esta versión incluye módulos avanzados para seguimiento, calibración y análisis de movimiento.  

---

### 🌐 Parte 3 — cables.gl  
Introducción a **[cables.gl](https://cables.gl)**, una plataforma online para composición visual basada en nodos.  
Se revisaron los **elementos básicos del entorno**, incluyendo:
- Panel de nodos y conexiones.  
- Inputs, Outputs y Operators.  
- Creación de animaciones simples y render en WebGL.  

---

### 🕹️ Parte 4 — Kinect + Processing  
Demostración del uso del **sensor Kinect** para captura de profundidad y movimiento, aplicando el flujo de video como textura en Processing.  
Se revisó la integración con **Syphon** para compartir la salida con otros entornos visuales.  

📚 Se discutieron conceptos clave de:
- Nubes de puntos (point clouds).  
- Tracking de usuarios.  
- Comunicación entre software mediante protocolos Syphon/NDI.  

---

### ⚡ Parte 5 — Arduino + Processing  
Ejercicio final: **Control de opacidad mediante sensor de distancia**.  
Se conectó un **sensor SHARP** a **Arduino**, enviando datos analógicos a **Processing** por puerto serial.  
El valor del sensor fue mapeado para modificar dinámicamente la **opacidad de una forma o imagen**.  

💡 Conceptos aplicados:
- Comunicación **Serial**.  
- Mapeo de valores con `map()`.  
- Sincronización entre hardware y visuales digitales.  

---

🧾 **Resumen de la clase:**  
- 💻 Integración de video con Syphon o NDI.  
- 🧠 Configuración de entorno Python + OpenCV en Raspberry.  
- 🌐 Exploración de cables.gl.  
- 🎮 Captura con Kinect y envío de video en red.  
- 🔧 Control de opacidad en Processing desde Arduino.
