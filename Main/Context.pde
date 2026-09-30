class Context {
  String name;
  PVector pos;
  PVector size, center;
  PVector origin;
  PGraphics graphics;
  ArrayList<StreamMode> streams;
  // Particle[] particles;

  Context(float x, float y, float w, float h, String name) {
    this.name = name;
    this.pos = new PVector(x, y);
    this.size = new PVector(w, h);
    this.center = new PVector(w/2, h/2);
    this.graphics = createGraphics((int)this.size.x, (int)this.size.y, P2D);
    this.graphics.smooth(4);
    this.streams = new ArrayList<StreamMode>();

    // create stream objects
    this.addStream(new ParticleStream());
    this.addStream(new BoomBoxStream());
    for (StreamMode mode : this.streams) {
      mode.init(this);
    }
  }

  void addStream(StreamMode mode) {
    this.streams.add(mode);
    mode.init(this);
  }

  void clearStreams() {
    this.streams.clear();
  }

  void update() {
    for (StreamMode mode : this.streams) {
      if (mode.isActive()) {
        mode.update(this);
      }
    }
  }

  void display() {
    this.graphics.beginDraw();
    this.graphics.clear();
    // this.graphics.background(0);
    for (StreamMode mode : this.streams) {
      mode.display(this);
    }
    this.graphics.endDraw();

    // render to the context graphics
    image(this.graphics, this.pos.x, this.pos.y, this.size.x, this.size.y);
  }
}
