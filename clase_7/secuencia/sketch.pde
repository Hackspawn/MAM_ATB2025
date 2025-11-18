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

  // Conectar puerto serial
  println(Serial.list());
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 115200);
  myPort.bufferUntil('\n');

  // Cargar imágenes
  File folder = new File(dataPath("frames"));
  File[] files = folder.listFiles();

  files = Arrays.stream(files)
    .filter(f -> f.getName().toLowerCase().matches(".*\\.(png|jpg|jpeg|gif)$"))
    .sorted(Comparator.comparing(File::getName))
    .toArray(File[]::new);

  totalFrames = files.length;
  println("Total de frames: " + totalFrames);

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
