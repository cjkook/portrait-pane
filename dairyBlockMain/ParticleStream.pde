class ParticleStream implements StreamMode {
  Particle[] particles;

  void init(Context ctx) {
    particles = new Particle[12];
    for (int i = 0; i < particles.length; i++) {
      particles[i] = new Particle(random(ctx.size.x), random(ctx.size.y), random(5, 80), ctx);
    }
  }

  void reset(Context ctx) {
    init(ctx);
  }

  void update(Context ctx) {
    for (int i = 0; i < this.particles.length; i++) {
      this.particles[i].update();
    }
  }

  void display(Context ctx) {
    ctx.graphics.beginDraw();
    ctx.graphics.clear();
    for (int i = 0; i < this.particles.length; i++) {
      this.particles[i].display();
    }
    ctx.graphics.endDraw();
  }
}