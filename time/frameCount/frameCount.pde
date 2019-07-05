float c;

void setup() {
    size(500, 500);
    ellipseMode(LEFT);
}

void draw() {
    c = (float)frameCount;
    background(255);
    fill(0);
    for (int i = 0; i < width / 10; i++) {
        float h = noise((i + c) / 100);
        fill(255 * h, 255 * h, 204 * h);
        ellipse(i * 10, height * h, 10, 10);
    }
}
