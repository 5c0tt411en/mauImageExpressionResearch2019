import gab.opencv.*;
import processing.video.*;

OpenCV cv;
Capture cap;

void setup() {
    size(640, 480);
    cap = new Capture(this, 640, 480, 30);
    cap.start();
}

void draw() {
    if (cap.available()) {
        cap.read();
    }
    cv = new OpenCV(this, cap);
    image(cv.getInput(), 0, 0);
    PVector loc = cv.max();
    fill(0, 255, 0);
    noStroke();
    ellipse(loc.x, loc.y, 10, 10);
}
