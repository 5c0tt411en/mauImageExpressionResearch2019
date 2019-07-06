import processing.video.*;
import jp.nyatla.nyar4psg.*;
import processing.sound.*;


Capture cap;
MultiMarker nya;
int idNum = 3;
PVector[] v = new PVector[idNum];
SinOsc sine;
float amp = 0., freq = 500.;

void setup() {
    size(640, 480, P3D);
    cap=new Capture(this, 640, 480);
    nya=new MultiMarker(this, width, height, "camera_para.dat", NyAR4PsgConfig.CONFIG_PSG);
    for (int i = 0; i < idNum; i++) {
        nya.addNyIdMarker(i, 60);
    }
    cap.start();

    sine = new SinOsc(this);
    sine.amp(0.0);
    sine.play();
}

void draw()
{
    if (cap.available()) {
        cap.read();
    }
    nya.detect(cap);
    nya.drawBackground(cap);
    for (int i = 0; i < idNum; i++) {
        if (nya.isExist(i)) {
            nya.beginTransform(i);
            v[i] = nya.object2ScreenCoordSystem(i, 0, 0, 0);
            nya.endTransform();
        }
    }
    if (nya.isExist(0)) {
        noFill();
        stroke(255);
        ellipse(v[0].x, v[0].y, 100, 100);
        noStroke();
        fill(64, 205, 181);
        rect(v[0].x - 30, v[0].y + 30, 30, - amp * 60);
        fill(210, 18, 85);
        rect(v[0].x, v[0].y + 30, 30, - freq * 60 / 1000);
        sine.amp(amp);
        sine.freq(freq);
    } else {
        sine.amp(0.0);
    }
    if (nya.isExist(0) && nya.isExist(1)) {
        amp = map(dist(v[0].x, v[0]. y, v[1].x, v[1].y), 0, dist(width, height, 0, 0), 1.0, 0.0);
        noFill();
        stroke(64, 205, 181);
        line(v[0].x, v[0]. y, v[1].x, v[1].y);
    }
    if (nya.isExist(0) && nya.isExist(2)) {
        freq = map(dist(v[0].x, v[0]. y, v[2].x, v[2].y), 0, dist(width, height, 0, 0), 1000.0, 0.0);
        noFill();
        stroke(210, 18, 85);
        line(v[0].x, v[0]. y, v[2].x, v[2].y);
    }
}
