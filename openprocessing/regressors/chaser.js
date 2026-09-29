class Chaser {
	constructor(x, y, speed) {
		this.pos = createVector(x, y);
		this.target = createVector(0,0); // note/height to chase 
		this.note = null;
		this.speed = speed;
		this.size = 0;
		this.seed = random(1000);
	}

	chooseTarget(note) {
		let n = note;
		n = (height / 12) * n;
		this.target = createVector(noise(this.seed) * (width), n + random(-20, 20));
	}

	// pass in the note to be chased
	update() {
		this.seed += this.speed / 10;

		this.size = noteFaker.velocity / 4;

		if (this.pos.y < this.target.y) {
			this.pos.y += this.speed;
		} else {
			this.pos.y -= this.speed;
		}

		if (this.pos.x < this.target.x) {
			this.pos.x += this.speed;
		} else {
			this.pos.x -= this.speed;
		}
	}
	display() {
		fill('orange');
		stroke(random(255), 0, 0, 5);
		line(this.pos.x, 0, this.pos.x, height);
		ellipse(this.pos.x, this.pos.y, this.size)
	}
}