class Mover {
	constructor(x, y, palette) {
		this.nSpd = createVector(random(-0.005,0.005),random(-0.005,0.005));
		this.pos = createVector(x, y); // location of mover
		this.maxOrb = 2; // max number of orbit objects
		this.orbits = []; // array of child orbit objects
		this.palette = palette; // colors
		this.size = random(50, 120); // size of mover
		for (let i = 0; i <= this.maxOrb-1; i++) {
			let t = shuffler(types);
			this.orbits[i] = new Orbit(
				random(150), // x
				0, // y
				t[2], // type
				palette); // colors
		}
	}
	update() {
		// update orbits
		this.orbits[0].pos.rotate(this.orbits[0].direction);

		this.orbits[0].update();
		this.pos.x += this.nSpd.x*300;
		this.pos.y = height * noise(this.nSpd.y * frameCount);
		if(this.pos.x > width+this.size) {
			this.pos.x = 0-this.size;
		} else if(this.pos.x <= -width) {
			this.pos.x = width+this.size;
		}
		// this.pos.x = width * noise(this.nSpd.x * frameCount);
		// this.pos.y = height * noise(this.nSpd.y * frameCount);
	}
	display() {
		fill(this.palette[1]);
		this.orbits.forEach((o, i) => {
			switch (o.type) {
				case 'triangle':
					drawTri(this, this.orbits[0]);
					break;
				case 'arc':
					drawArc(this, this.orbits[0]);
					break;
				case 'line':
					drawLine(this, this.orbits[0]);
					break;
			}

		})
		
		// draw mover
		fill(this.palette[2]);
		stroke(this.palette[1])
		ellipse(this.pos.x, this.pos.y, this.size * noise(this.nSpd.y * frameCount));

	}
}