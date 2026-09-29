// Cross Hatching 3
// Create a corss hatched image of the original
// Art Simulates Nature
// Sep 29, 2022

let spacing = 8;
let i = 0;
let j = 0;

function setup() {
  createCanvas(820, 400);
	strokeWeight(0.1);
  background(255);
  blob = loadImage('https://deckard.openprocessing.org/user202476/visual2473293/h67fa03cc6a82dbc094c513c60d1b8753/peak.jpg');
}

function draw() {
  image(blob, 0, 0, 400, 400);
  translate(420, 0);
  stroke(0);

  let c = get(i, j);
  let n = get(i, j - spacing);
  let w = get(i - spacing, j);
  let s = get(i, j + spacing);
  let e = get(i + spacing, j);
  let nw = get(i - spacing, j - spacing);
  let sw = get(i - spacing, j + spacing);
  let se = get(i + spacing, j + spacing);
  let ne = get(i + spacing, j - spacing);

  // "/"
  if (c[0] < 200 && ne[0] < 200) {
    line(i, j, i + spacing, j - spacing);
  }

  if (c[0] < 200 && sw[0] < 200) {
    line(i, j, i - spacing, j + spacing);
  }

  // "\"
  if (c[0] < 150 && nw[0] < 150) {
    line(i, j, i - spacing, j - spacing);
  }

  if (c[0] < 150 && se[0] < 150) {
    line(i, j, i + spacing, j - spacing);
  }

  // "-"
  if (c[0] < 100 && w[0] < 100) {
    line(i, j, i - spacing, j);
  }

  if (c[0] < 100 && e[0] < 100) {
    line(i, j, i + spacing, j);
  }

  // "|"
  if (c[0] < 50 && n[0] < 100) {
    line(i, j, i, j - spacing);
		text("*",i,j)
  }

  if (c[0] < 50 && s[0] < 100) {
    line(i, j, i, j + spacing);
  }

  i += spacing;
  if (i > 400) {
    i = 0;
    j += spacing;

  }
  else if (j > 400) {
    print('Done');
    //saveCanvas('yosemite_4', 'png');
    noLoop();
  }
}