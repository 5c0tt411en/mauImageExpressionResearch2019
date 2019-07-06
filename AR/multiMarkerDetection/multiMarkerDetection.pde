import processing.video.*;
import jp.nyatla.nyar4psg.*;

Capture cap;
MultiMarker nya;
int idNum = 10;

void setup() {
    size(640, 480, P3D);
    cap=new Capture(this, 640, 480);
    nya=new MultiMarker(this, width, height, "camera_para.dat", NyAR4PsgConfig.CONFIG_PSG);
    for (int i = 0; i < idNum; i++) {
        nya.addNyIdMarker(i, 60);
    }
    cap.start();
}

void draw()
{
    if (cap.available()) {
        cap.read();
    }
    nya.detect(cap);
    background(0);
    nya.drawBackground(cap);
    for (int i = 0; i < idNum; i++) {
        if (nya.isExist(i)) {
            nya.beginTransform(i);
            rect(-30, -30, 60, 60);
            fill(0, 0, 255);
            nya.endTransform();
        }
    }
}
