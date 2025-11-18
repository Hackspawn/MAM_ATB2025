import oscP5.*;
import netP5.*;

OscP5 osc;

void setup() {
  osc = new OscP5(this, 9000);
}

void oscEvent(OscMessage msg) {
  if (msg.checkAddrPattern("/pot")) {
    float val = msg.get(0).floatValue(); // 0–1 o 0–1023 según tu envío
    currentFrame = int(map(val, 0, 1023, 0, totalFrames - 1));
  }
}
