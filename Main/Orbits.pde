class Orbit {
  Context context;
  PGraphics graphics;
  PVector parentPos, parentSize;
  String type;
  float radius, angle, speed;
  String[] types = {"circle", "swirl", "square", "triangle", "line", "arc"};

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

  void update() {
    this.angle += this.speed * 0.01; // update angle based on speed
  }

  void display() {
    float x = this.parentPos.x + cos(this.angle) * this.radius;
    float y = this.parentPos.y + sin(this.angle) * this.radius;

    this.graphics.noFill();
    this.graphics.stroke(255);
    this.graphics.strokeWeight(3);

    switch (this.type) {
    case "circle":
      this.graphics.ellipse(x, y, 20, 20);
      break;
    case "swirl":
      this.graphics.pushMatrix();
      this.graphics.translate(this.parentPos.x, this.parentPos.y);
      this.graphics.rotate(this.angle);
      this.graphics.translate(this.radius, 0);
      this.graphics.arc(0, 0, 300, 300, 0, PI);
      this.graphics.popMatrix();
      break;
    case "square":
      this.graphics.rect(x - 10, y - 10, 20, 20);
      break;
    case "triangle":
      float thirdX = this.parentPos.x + cos(this.angle + PI / 3) * this.radius;
      float thirdY = this.parentPos.y + sin(this.angle + PI / 3) * this.radius;

      this.graphics.triangle(
        this.parentPos.x, this.parentPos.y,
        x, y,
        thirdX, thirdY
        );
      break;
    case "line":
      this.graphics.line(this.parentPos.x, this.parentPos.y, x + 100, y + 100);
      break;
    case "arc":
      //   this.graphics.noStroke();
      this.graphics.strokeWeight(20);
      this.graphics.arc(
        this.parentPos.x,
        this.parentPos.y,
        this.parentSize.x*1.2,
        this.parentSize.y*1.2,
        this.angle,
        this.angle + PI / 3
        );
      break;
    }
  }
}
