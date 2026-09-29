class Swatch {
  color[] current;
  color[] target;
  PVector size;
  PVector pos;

  Swatch(float x, float y, float w, float h, color[] current, color[] target) {
    this.pos = new PVector(x, y);
    this.size = new PVector(w, h);
    this.current = current;
    this.target = target;
  }

  void updateTarget(color[] newTarget) {
    this.target = newTarget;
  }

  void updateCurrent(color[] newCurrent) {
    this.current = newCurrent;
  }

  void display() {
    float barY = height - this.size.y;  // always bottom
    float currentX = this.pos.x;
   
    noStroke();
    for (int i = 0; i < this.current.length; i++) {
      fill(this.current[i]);
      rect(this.pos.x + i * this.size.x, barY, this.size.x, this.size.y);
    }

    for (int i = 0; i < this.target.length; i++) {
      fill(this.target[i]);
      rect(width/2-this.pos.x + i * this.size.x,  barY, this.size.x, this.size.y);
    }
  }
}
