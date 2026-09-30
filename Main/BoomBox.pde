class BoomBox {
  int maxOrbits=6, barkIndex;
  PVector pos = new PVector(0, 0);
  PVector size = new PVector(100, 100);
  String[] palette;
  Context context;
  PGraphics graphics;
  // child orbit classes
  Orbit[] orbits = new Orbit[maxOrbits];

  BoomBox(PVector pos, Context context) {
    this.pos.x = pos.x;
    this.pos.y = pos.y;
    this.context = context;
    this.graphics = context.graphics;
    float s = min(context.size.x, context.size.y) * 0.7;
    this.size = new PVector(s, s);

    this.barkIndex = int(random(0, 3)); // 50-250hz

    // create orbits
    for (int i = 0; i < this.orbits.length; i++) {
      this.orbits[i] = new Orbit(this.pos, this.size, this.context);
    }
  }

  void update() {
    for (int i = 0; i < this.orbits.length; i++) {
      this.orbits[i].update();
    }
  }

  void display() {
    this.graphics.noFill();
    this.graphics.strokeWeight(40);
    this.graphics.ellipse(this.pos.x, this.pos.y, this.size.x, this.size.y);
    for (int i = 0; i < this.orbits.length; i++) {
      this.orbits[i].display();
    }
  }
}
