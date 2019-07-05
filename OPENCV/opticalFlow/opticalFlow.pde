import gab.opencv.*;
import processing.video.*;

Capture cap;
OpenCV cv;

void setup() {
    size(640, 480);
    cap = new Capture(this, 640/2, 480/2);
    cv = new OpenCV(this, 640/2, 480/2);
    cap.start();
}

void draw() {
    if (cap.available()) {
        cap.read();
    }
    scale(2.0);
    cv.loadImage(cap);
    image(cap, 0, 0 );
    cv.calculateOpticalFlow();
    stroke(0, 255, 0);
    cv.drawOpticalFlow();
}
