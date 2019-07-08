import gab.opencv.*;
import processing.video.*;

Capture cap;
OpenCV cv;

void setup() {
    size(640, 480);
    cap = new Capture(this, 640, 480, 30);
    cap.start();
    cv = new OpenCV(this, cap);
    cv.startBackgroundSubtraction(5, 3, 0.5);
}

void draw() {
    if (cap.available()) {
        cap.read();
    }
    image(cap, 0, 0);
    cv.loadImage(cap);
    cv.updateBackground();
    for (Contour contour : cv.findContours()) {
        contour.draw();
    }
}
