class Orbit {
	constructor(x, y, type, palette) {
		// env are each a percentage of 100
		this.envelope = [5,15];
		this.envIndex = 0;
		this.ADSR = false;
		this.size = 0;
		this.age = 0;
		this.maxAge = random(0, 2);
		this.type = type;
		// 3D vector to hold size variations for shapes
		this.sizeMax = createVector(
			random(100, 250),
			random(100, 250),
			random(200, 350));
		this.pos = createVector(x, y);
		this.movement = createVector(random(-10, 10), random(-10, 10))
		this.direction = random(-0.1, 0.1);
		this.origin = random(0, 10);
		this.colors = shuffler(palette);
		this.arc_mode = CHORD;
		this.reactive = random() < 0.05 ? true : false;
	}

	update() {
		// if the envelope is active
		if(this.ADSR) {
			let step;
			// step thru envelopes to determine stage
			this.envelope.forEach((e,i)=>{
				if(this.envIndex > e) {
					step = i;
				}
			});

			
		}
		switch (this.type) {
			case 'arc':
			case 'circle':
			case 'triangle':
			case 'line':
			default:
		}
	}

	shuffleColors() {
		this.colors = shuffler(this.colors)
	}
	shuffleMovement() {
		this.movement.x = random(-10, 10);
		this.movement.y = random(-10, 10);
	}
	shuffleDirection() {
		this.direction = random(-1, 1);
	}
	changeType(t = 0) {
		switch (t) {
			case 0:
				// shuffle a new type
				// this.type = 
			default:
				this.type = t;
		}
	}
}
