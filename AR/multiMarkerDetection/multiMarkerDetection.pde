import processing.video.*;
import jp.nyatla.nyar4psg.*;

Capture cam;
MultiMarker nya;
int idNum = 10;

void setup() {
    size(640, 480, P3D);
    println(MultiMarker.VERSION);
    cam=new Capture(this, 640, 480);
    nya=new MultiMarker(this, width, height, "camera_para.dat", NyAR4PsgConfig.CONFIG_PSG);
    for (int i = 0; i < idNum; i++) {
        nya.addNyIdMarker(i, 60);
    }
    cam.start();
}

void draw()
{
    if (cam.available()) {
        cam.read();
    }
    nya.detect(cam);
    background(0);
    nya.drawBackground(cam);
    for (int i = 0; i < idNum; i++) {
        if (nya.isExist(i)) {
            nya.beginTransform(i);
            rect(-40, -40, 80, 80);
            fill(0, 0, 255);
            nya.endTransform();
        }
    }
}
