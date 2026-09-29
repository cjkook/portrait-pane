function fnEnvelope(env,step) {
	
}
function drawCircle(base, orbit) {
	
}

function drawLine(base, orbit) {
	push();
	stroke(orbit.colors[1]);
	strokeWeight(0.2);
	translate(base.pos.x, base.pos.y);
	rotate(orbit.pos.heading());
	// broken
	// line(0,0,orbit.lineVector.x*orbit.age, orbit.lineVector.y*orbit.age);
	pop();
}

function edgeRacer(base,orbit) {
	
}

function drawArc(base, orbit) {
	push();
	stroke(orbit.colors[1]);
	strokeWeight(1);
	fill(orbit.colors[0]);
	translate(base.pos.x, base.pos.y);
	rotate(orbit.pos.heading());
	arc(0, 0, orbit.sizeMax.x * noise(base.nSpd.x * frameCount), orbit.sizeMax.x* noise(base.nSpd.y * frameCount), HALF_PI, PI, PIE, orbit.arc_mode);
	pop();
}

function drawTri(base, orbit) {
	push();
	stroke(orbit.colors[1]);
	strokeWeight(1);
	fill(orbit.colors[0]);
	translate(base.pos.x, base.pos.y);
	rotate(orbit.pos.heading()+orbit.origin);
	translate(orbit.pos.mag(),0);
	triangle(0, orbit.size / 4, 0, -orbit.size / 4, orbit.size/2, 0);
	pop();
}

function shuffler(array) {
	let currentIndex = array.length,
		randomIndex;
	// While there remain elements to shuffle.
	while (currentIndex > 0) {
		// Pick a remaining element.
		randomIndex = Math.floor(Math.random() * currentIndex);
		currentIndex--;
		// And swap it with the current element.
		[array[currentIndex], array[randomIndex]] = [
			array[randomIndex], array[currentIndex]
		];
	}
	return array;
}

function createPalette(_url) {
	let slash_index = _url.lastIndexOf("/");
	let pallate_str = _url.slice(slash_index + 1);
	let arr = pallate_str.split("-");
	for (let i = 0; i < arr.length; i++) {
		arr[i] = color("#" + arr[i]);
	}
	return arr;
}