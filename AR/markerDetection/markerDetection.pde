import processing.video.*;
import jp.nyatla.nyar4psg.*;

Capture cap;
MultiMarker nya;
int id = 0;

void setup() {
    size(640, 480, P3D);
    cap=new Capture(this, 640, 480);
    nya=new MultiMarker(this, width, height, "camera_para.dat", NyAR4PsgConfig.CONFIG_PSG);
    nya.addNyIdMarker(id, 60);
    cap.start();
}

void draw() {
    if (cap.available()) {
        cap.read();
    }
    nya.detect(cap);
    nya.drawBackground(cap);
    if (nya.isExist(id)) {
        nya.beginTransform(id);
        translate(0, 0, 20);
        box(40);
        nya.endTransform();
    }
}
