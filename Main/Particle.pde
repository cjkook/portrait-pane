class Particle {
  Context context;
  PGraphics graphics;
  float x, y, radius, targetRadius, radiusMax, sizeEasing;
  int barkIndex;
  PVector pos;
  PVector spd;
  int mode, fillIndex, strokeIndex, fill2Index, fillAlpha, strokeAlpha;
  int numModes = 3;
  PVector noiseOffset; // perlin noise timeline
  // PVector acc;

  Particle(float x, float y, float r, Context c) {
    this.pos = new PVector(x, y);
    this.spd = new PVector(random(-1, 1), random(-1, 1));
    this.noiseOffset = new PVector(random(-100, 100), random(-100, 100));
    // this.acc = new PVector(0, 0);
    this.radiusMax = (c.size.x + c.size.y) * 0.1; // max radius is 10% of context dimensions
    this.radius = r;
    this.targetRadius = r;
    this.sizeEasing = random(0.02, 0.1);

    // color
    this.fillIndex = int(random(0, currentPalette.length));
    this.strokeIndex = int(random(0, currentPalette.length));
    if (this.strokeIndex == this.fillIndex) {
      this.strokeIndex = (this.strokeIndex + 1) % currentPalette.length;
    }
    this.fill2Index = int(random(0, currentPalette.length));
    this.fillAlpha = int(random(100, 200));
    this.strokeAlpha = int(random(0, 200));

    // context/bark assignment
    this.barkIndex = int(random(8, bark24.length-5)); // 1k to 4k bark range
    this.context = c;
    this.graphics = c.graphics;
  }

  void update() {
    // direction randomization using Perlin noise
    if (random(1) < 0.09) {
      float n = noise(this.noiseOffset.x + frameCount * 0.01,
        this.noiseOffset.y + frameCount * 0.01);

      float targetAngle = map(n, 0, 1, -PI, PI);

      PVector targetDir = PVector.fromAngle(targetAngle);
      targetDir.normalize();
      targetDir.mult(1.0); // desired speed

      // smooth turn toward the target direction
      this.spd.lerp(targetDir, 0.15);
      this.noiseOffset.x += random(-0.3, 0.3);
      this.noiseOffset.y += random(-0.2, 0.2);

      // update radius based on bark value
      this.targetRadius = bark24[this.barkIndex] * this.radiusMax / 2; // scale bark value to radius
      this.radius = lerp(this.radius, this.targetRadius, this.sizeEasing);
    }

    // update position
    this.pos.add(this.spd);

    // Wrap each axis independently, allowing the whole particle to leave the buffer.
    if (this.pos.x - this.radiusMax > this.context.size.x) {
      this.pos.x = -this.radius;
    } else if (this.pos.x + this.radiusMax < 0) {
      this.pos.x = this.context.size.x + this.radius;
    }

    if (this.pos.y - this.radiusMax > this.context.size.y) {
      this.pos.y = -this.radius;
    } else if (this.pos.y + this.radiusMax < 0) {
      this.pos.y = this.context.size.y + this.radius;
    }
  }

  void display() {

    this.graphics.noStroke();
    this.graphics.fill(currentPalette[this.fillIndex], 100);
    this.graphics.ellipse(this.pos.x+random(-this.radius/2, this.radius/2), this.pos.y+random(-this.radius/2, this.radius/2), this.radius/10, this.radius/10);
    this.graphics.fill(currentPalette[this.fillIndex], 220);
    this.graphics.stroke(currentPalette[this.strokeIndex], 200);
    this.graphics.ellipse(this.pos.x, this.pos.y, this.radius, this.radius);
  }
}
