import gab.opencv.*;
import processing.video.*;

ArrayList<PVector> p;
int thre = 240;

OpenCV cv;
Capture cap;

void setup() {
    size(640, 480);
    cap = new Capture(this, 640, 480, 30);
    cap.start();
    p = new ArrayList<PVector>();
}

void draw() {
    if (cap.available()) {
        cap.read();
    }
    cv = new OpenCV(this, cap);
    image(cv.getInput(), 0, 0);
    PVector loc = cv.max();

    color c = get(int(loc.x), int(loc.y));
    if (red(c) > 240 && green(c) > 240 && blue(c) > 240) {
        p.add(loc);
    }
    stroke(255, 0, 0);
    for (int i = 0; i < p.size(); i++) {
        if (i != p.size() - 1)
            line(p.get(i).x, p.get(i).y, p.get(i + 1).x, p.get(i + 1).y);
    }
}
