class Trailblazer {
	constructor(x, y) {
		this.pos = createVector(x, y)
		this.trail = [];
		this.target = 0;
		this.length = 10;
		this.size = random(10,100);

		for (let i = 0; i < this.length; i++) {
			this.trail[i] = createVector(Math.floor(random(width)), Math.floor(random(height)))
		}
	}
	update() {
		let dist = p5.Vector.dist(this.pos,this.trail[this.target]);
		if (this.pos.x <= this.trail[this.target].x) {
			this.pos.x++;
		} else {
			this.pos.x--;
		}
		if (this.pos.y <= this.trail[this.target].y) {
			this.pos.y++;
		} else {
			this.pos.y--;
		}
		if(dist < this.size) {
			this.target++;
			if(this.target>this.length-1) {
				this.target = 0;
			}
		}
		
	}
	display() {
		fill(255, 5, 5);
		stroke('turquoise')
		ellipse(this.pos.x, this.pos.y, this.size)
	}
}