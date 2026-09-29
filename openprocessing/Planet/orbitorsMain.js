let movers = [];
let types = ["triangle", "arc", "line"];
let palettes = ['https://coolors.co/palette/264653-2a9d8f-e9c46a-f4a261-e76f51']
let palette;

function setup() {
	createCanvas(windowWidth, windowHeight);
	background(100);
	palette = createPalette(palettes[0])

	for (let i = 0; i <= 15; i++) {
		movers[i] = new Mover(random(width), random(height), palette);
	}

}

function draw() {
	// background(200);
	fill(250, 250, 250, 0);
	rect(-1, -1, width + 3, height + 3)

	movers.forEach((m, i) => {
		m.update();
		m.display();
	})
}