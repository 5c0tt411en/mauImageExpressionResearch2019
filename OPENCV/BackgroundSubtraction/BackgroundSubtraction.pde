import gab.opencv.*;
import processing.video.*;

Capture cam;
OpenCV cv;

void setup() {
    size(640, 480);
    cam = new Capture(this, 640, 480, 30);
    cam.start();
    cv = new OpenCV(this, cam);
    cv.startBackgroundSubtraction(5, 3, 0.01);
}

void draw() {
    if (cam.available()) {
        cam.read();
    }
    image(cam, 0, 0);
    cv.loadImage(cam);
    cv.updateBackground();
    for (Contour contour : cv.findContours()) {
        contour.draw();
    }
}
