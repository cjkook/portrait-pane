class Orbit {
    Context context;
    PGraphics graphics;
    PVector parentPos, parentSize;
    String type;
    float radius, angle, speed;
    String[] types = {"circle", "arc", "square", "triangle", "line"};

    Orbit(PVector parentPos, PVector parentSize, Context c) {
        this.parentPos = parentPos;
        this.parentSize = parentSize;
        this.radius = random(0, parentSize.x * 0.5); // random radius within half of parent size
        this.speed = random(0.5, 2.0); // random speed
        this.type = getRandomIndex(types.length) >= 0 ? types[getRandomIndex(types.length)] : "circle"; // random type
        this.angle = random(TWO_PI);
        this.context = c;
        this.graphics = c.graphics;
    }

     void update(float bark) {
        this.angle += this.speed * 0.01; // update angle based on speed
    }

    void display() {
        float x = this.parentPos.x + cos(this.angle) * this.radius;
        float y = this.parentPos.y + sin(this.angle) * this.radius;

        this.graphics.noFill();
        this.graphics.stroke(255);
        this.graphics.strokeWeight(2);

        switch (this.type) {
            case "circle":
                this.graphics.ellipse(x, y, 20, 20);
                break;
            case "arc":
                this.graphics.arc(x, y, 30, 30, 0, PI);
                break;
            case "square":
                this.graphics.rect(x - 10, y - 10, 20, 20);
                break;
            case "triangle":
                this.graphics.triangle(x, y - 10, x - 10, y + 10, x + 10, y + 10);
                break;
            case "line":
                this.graphics.  line(x - 10, y - 10, x + 10, y + 10);
                break;
        }
    }
}