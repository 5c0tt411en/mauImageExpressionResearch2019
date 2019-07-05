import gab.opencv.*;
import processing.video.*;

ArrayList <Particle> p;

Capture cap;
OpenCV cv;
int sc = 2;

void setup() {
    size(640, 480);
    cap = new Capture(this, 640/sc, 480/sc);
    cv = new OpenCV(this, 640/sc, 480/sc);
    cap.start();
    p = new ArrayList<Particle>();
    blendMode(ADD);
}

void draw() {
    background(0);
    if (cap.available()) {
        cap.read();
    }
    scale(sc);
    cv.loadImage(cap);
    image(cap, 0, 0);
    cv.calculateOpticalFlow();
    for (int y = 0; y < height / sc; y++) {
        for (int x = 0; x < width / sc; x++) {
            PVector v = cv.getFlowAt(x, y);
            if (v.mag() > 60) {
                p.add(new Particle(x, y, int(v.x)/sc, int(v.y)/sc, 2 / sc));
            }
        }
    }
    for (int i = 0; i < p.size(); i++) {
        p.get(i).draw();    
        if (p.get(i).isOver() || p.get(i).isOut()) { 
            p.remove(i);    
        }
    }
}
