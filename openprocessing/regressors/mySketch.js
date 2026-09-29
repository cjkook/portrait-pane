let regressors = [];
let chasers = [];
let colors = ["#14213d", "#fca311", "#e5e5e5", "#ffffff"]
let size = 50;
let rows;
let cols;
let tbs = []; // trailblazers
let noteFaker;
let mode = 0;

function setup() {
	createCanvas(500, 500);
	background(100, 50);

	noteFaker = new Notefaker(12, 60, 300);
	
	rows = height / size;
	cols = width / size;
	for (let i = 0; i <= cols; i++) {
		regressors[i] = [];
		for (let j = 0; j <= rows; j++) {
			regressors[i][j] = new Regressor(i,
																			 j,
																			 size * random(0.25,3.5), // max
																			 size * random(0.6, 1), // starting size
																			 random(0.1, 0.9)) // speed
		}
	}
	for (let i = 0; i <= 10; i++) {
		tbs[i] = new Trailblazer(random(width), random(height))
	}
	
	// note chasers
	for (let i = 0; i <= 10; i++) {
		chasers[i] = new Chaser(width/2, random(height),random(0,2))
	}
}

function draw() {
	noteFaker.update();
	background(255, 10);
	switch (mode) {
		case 0: // trailblazers
			tbs.forEach((tb, i) => {
				tb.update();
				tb.display();
			});
		case 1: // regressors
			for (let i = 0; i <= cols; i++) {
				for (let j = 0; j <= rows; j++) {
					regressors[i][j].update();
					regressors[i][j].display();
				}
			}
		case 2: // note chaser
			chasers.forEach((nc, i) => {
				nc.update();
				nc.display();
			})
	}
}s