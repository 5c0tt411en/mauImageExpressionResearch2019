class Particle {
    int x;
    int y;
    int vx;
    int vy;
    int d;
    int age;
    int life;
    Particle(int _x, int _y, int _vx, int _vy, int _d) {
        x = _x;
        y = _y;
        vx = _vx;
        vy = _vy;
        d = _d;
        age = 0;
        life = int(random(10, 20));
    }
    void draw() {
        age++;
        x += vx;
        y += vy;
        fill(0, 255, 0);
        ellipse(x, y, d, d);
    }
    Boolean isOver() {
        Boolean ov;
        ov = age >= life ? true : false;
        return ov;
    }
    Boolean isOut() {
        Boolean ou;
        ou = (x >= width - d / 2 || x <= d / 2 || y >= height - d / 2 || y <= d / 2) ? true : false;
        return ou;
    }
}
