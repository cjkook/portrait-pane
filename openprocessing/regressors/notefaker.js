class Notefaker {
	constructor(notes,minFreq,maxFreq) {
		this.notes = notes; // number of notes to switch between
		this.note = Math.ceil(random(this.notes));
		this.minFreq = minFreq; // minimum interval to repeat
		this.maxFreq = maxFreq; // maximum interval to repeat
		this.interval = Math.ceil(random(this.minFreq, this.maxFreq));
		this.count = 0;
		this.n = 0; // noise counter
		this.nSpeed = 0.0001; // speed noise changes
		this.velocity = noise(this.n); 
		
	}
	
	update() {
		console.log("current note: ",this.note, "count is: ", this.count, "at vel: ", this.velocity);
		this.n+=0.01;
		this.velocity = noise(this.n)*127;
		this.count++;
		
		// reset if interval has passed
		if(this.count>this.interval) {
			this.count = 0;
			this.note = Math.ceil(random(this.notes));
			this.interval = Math.ceil(random(this.minFreq, this.maxFreq));
		}
	}
}