import processing.video.*;
import gab.opencv.*;
import java.awt.Rectangle;

Capture cap;
OpenCV cv;
Rectangle[] faces;

PImage img;

void setup() {
    size(640, 480);
    cap = new Capture(this, 640, 480, 30);
    cap.start();
    img = loadImage("warai.png");
}

void draw() {
    if (cap.available()) {
        cap.read();
    }
    cv = new OpenCV(this, cap);

    cv.loadCascade(cv.CASCADE_FRONTALFACE);
    faces = cv.detect();

    image(cv.getInput(), 0, 0);

    for (int i = 0; i < faces.length; i++) {
        image(img, faces[i].x, faces[i].y, faces[i].width, faces[i].width);
    }
}
