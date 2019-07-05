int w, h;
int d = 50, 
    dS = d + d, 
    dM = dS + d;

void setup() {
    size(500, 500);
    w = width;
    h = height;
}

void draw() {
    background(0);
    for (int i = 0; i < 60; i++) {
        float s = sin(radians(6 * i));
        float c = cos(radians(6 * i));
        if (i <= second()) {
            stroke(246, 239, 247);
            line(d * s + w / 2, - d * c + h / 2, dS * s + w / 2, - dS * c + h / 2);
        }
        if (i <= minute()) {
            stroke(166, 188, 219);
            line(dS * s + w / 2, - dS * c + h / 2, dM * s + w / 2, - dM * c + h / 2);
        }
    }
}
