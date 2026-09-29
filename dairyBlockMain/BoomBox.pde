class BoomBox {
  int maxOrbits=6;
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

    // create orbits
    for (int i = 0; i < this.orbits.length; i++) {
      this.orbits[i] = new Orbit(this.pos, this.size, this.context);
    }
  }

  void update(float bark) {
    for (int i = 0; i < this.orbits.length; i++) {
      this.orbits[i].update(bark);
    }
  }

  void display() {
    this.graphics.ellipse(this.pos.x, this.pos.y, this.size.x, this.size.y);
    for (int i = 0; i < this.orbits.length; i++) {
      this.orbits[i].display();
    }
  }
}
