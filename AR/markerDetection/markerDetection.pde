import processing.video.*;
import jp.nyatla.nyar4psg.*;

Capture cam;
MultiMarker nya;
int id = 0;

void setup() {
    size(640, 480, P3D);
    println(MultiMarker.VERSION);
    cam=new Capture(this, 640, 480);
    nya=new MultiMarker(this, width, height, "camera_para.dat", NyAR4PsgConfig.CONFIG_PSG);
    nya.addNyIdMarker(id, 60);
    cam.start();
}

void draw()
{
    if (cam.available()) {
        cam.read();
    }
    nya.detect(cam);
    nya.drawBackground(cam);
    if (nya.isExist(id)) {
        nya.beginTransform(id);
        translate(0, 0, 20);
        box(40);
        nya.endTransform();
    }
}
