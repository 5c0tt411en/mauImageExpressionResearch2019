import processing.video.*;
import deadpixel.keystone.*;

Keystone ks;
CornerPinSurface surface;
Capture cap;
PImage img;
PGraphics pg;

void setup() {
    size(640, 480, P3D);
    ks = new Keystone(this);
    surface = ks.createCornerPinSurface(640, 480, 20);
    pg = createGraphics(640, 480, P3D);
    cap = new Capture(this, 640, 480, 30);
    cap.start();
    img = createImage(width, height, ARGB );
    rectMode(CENTER);
}

void draw() {
    if (cap.available()) cap.read();
    background(0);
    image(cap, 0, 0);
    noStroke();
    fill(255, 0, 0);
    rect(width / 2, height / 2, 100, 100);

    img.loadPixels();
    for (int i = 0; i < img.pixels.length; i++) {
        img.pixels[i] = get(i % width, i / width);
    }
    img.updatePixels();

    background(0);
    pg.beginDraw();
    pg.image(img, 0, 0);
    pg.endDraw();
    surface.render(pg);
}

void keyPressed() {
    if (key == 'c') ks.toggleCalibration();
    if (key == 'l') ks.load();
    if (key == 's') ks.save();
}
