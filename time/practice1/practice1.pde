int counter = 0;

void setup() {
    size(500, 500);
}

void draw() {
    background(0);
    if (second() == minute()) {
        if (counter % 3 == 0)
            background(255, 0, 0);
        else if (counter % 3 == 1)
            background(0, 255, 0);
        else if (counter % 3 == 2)
            background(0, 0, 255);
        
        counter++;
    }
    else
        counter = 0;
}
