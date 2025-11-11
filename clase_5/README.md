# 🧩 Clase #5  
### 💡 Resolución de Ejercicios de las clases 2-3-4  

Durante la clase de hoy hemos desarrollado los ejercicios pendientes de las clases **2, 3 y 4**, consolidando los conocimientos sobre **sensores**, **mapeo de datos** y **envío de mensajes MIDI** desde **Arduino** hacia **Sonic Pi**.  

Los estudiantes trabajaron en **dos mesas de proyecto rotativas**, explorando distintas configuraciones y dispositivos:  

---

#### 🎛️ Mesa 1  
Conexión del **sensor de distancia SHARP GP2Y0A02YK0F (20–150 cm)** con **Arduino Zero**, utilizando la librería **MIDIUSB** para enviar mensajes **MIDI** hacia **Sonic Pi**.  
Este ejercicio retomó y amplió las prácticas de las clases 2 y 3, centradas en la conversión de valores analógicos en señales digitales interpretables como notas musicales.  

---

#### 🌡️ Mesa 2 (A y B)  
Implementación de **detección de temperatura** mediante el sensor **TMP36**, **registro de datos** en una **tarjeta MicroSD**, y revisión de los **protocolos de comunicación SPI** y los **sistemas de archivos FAT32** empleados en el almacenamiento de datos.  
Este ejercicio permitió comprender la lectura, escritura y estructuración de datos en memorias externas.  

---

### 🧠 Introducción a Raspberry Pi  

Una vez finalizadas las rotaciones entre mesas, se introdujo la **Raspberry Pi** como **microcomputador** aplicado a proyectos de **Artes Mediales**, destacando sus diferencias respecto a los **microcontroladores Arduino**.  

Se revisaron las características de su arquitectura, las funciones de los **pines GPIO**, y se realizó un **tutorial de instalación del sistema operativo Raspberry Pi OS**.

![Mapa de Pines GPIO](GPIO-Pinout-Diagram-2.png)

---

#### ⚙️ Configuración inicial del sistema  

El videotutorial se encuentra disponible en la carpeta Drive del Curso. 

![Explicación de Configuración VNC](Raspi_vid.png)

El proceso de configuración se llevó a cabo mediante la herramienta `raspi-config`, ejecutada desde la terminal con el siguiente comando:  

```bash
sudo raspi-config
```
