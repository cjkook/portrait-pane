// agent to control circles morphing between sizes
// 
class Regressor {
	constructor(x, y, max, size, speed) {
		this.pos = createVector(x, y);
		this.maxSize = max; // largest size
		this.size = size; // current size
		this.stroke = random() > 0.5 ? true : false;
		this.size2 = size * 0.5;
		this.speed = speed / 1;
		this.frame = random();
		this.window = Math.floor(random(30, 1000));
		this.growth = random() > 0.5 ? true : false;
		this.color = colors[Math.floor(random() * colors.length)];
		this.color2 = colors[Math.ceil(random() * colors.length) - 1];
	}
	update() {
		if (frameCount % this.window == 0) {
			this.active = true;
		}
		if (this.active) {
			if (this.growth && this.size <= this.maxSize) {
				this.size += this.speed;
				this.size2 -= this.speed / 2;
			} else if (!this.growth && this.size > 0) {
				this.size -= this.speed;
				this.size2 += this.speed / 2;
			} else if (this.size <= 0 || this.size > this.maxSize) {
				this.active = false;
				this.growth = !this.growth;
				this.window = Math.floor(random(30, 1000));
			}
		}

	}
	display() {
		if (this.active) {
			push();
			if (this.stroke) {
				stroke('black')
			} else {
				noStroke();
			}
			fill(this.color+"10");
			translate((this.pos.x * size), this.pos.y * size)
			ellipse(this.pos.x, this.pos.y, this.size);
			fill(this.color2)
			ellipse(this.pos.x, this.pos.y, this.size2);
			pop();
		}

	}
}