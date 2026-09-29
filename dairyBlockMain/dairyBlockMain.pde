import spout.*;
import oscP5.*;
import netP5.*;
import java.util.Arrays; // array utility

// spout objects
Spout spoutA;
Spout spoutB;
Spout spoutC;


color[] currentPalette;
color[] targetPalette;
boolean paletteEqual = false;
color[] paletteColors;
String[] urls;


float[][] contextBounds;
final int PTTRN_CONTEXT = 0;
final int MAIN_CONTEXT = 1;
final int SUPP_CONTEXT = 2;
Context patternContext;
Context mainContext;
Context supportContext;

Swatch swatch;

void setup() {
  // fullScreen();
  size(1280, 800, P2D); // P2D or P3D renderer is required for Spout


  // currentPalette = createPalette("https://coolors.co/273c2c-626868-939196-d3c1d2-ffe2fe");
  urls = new String[] {
    "https://coolors.co/273c2c-626868-939196-d3c1d2-ffe2fe", // mauve backroom
    "https://coolors.co/ffb5a7-fcd5ce-f8edeb-f9dcc4-fad2e1", // almond seashell
    "https://coolors.co/780000-c1121f-fdf0d5-003049-669bbc", // fiery ocean
    "https://coolors.co/335c67-fff3b0-e09f3e-9e2a2b-540b0e", // dark sunset
    "https://coolors.co/006d77-83c5be-edf6f9-ffddd2-e29578" // pearl delight
  };
  paletteColors = createUrlColorArray(urls);
  currentPalette = createPalette(urls[0]);
  targetPalette = createPalette(urls[2]);

  // create context bounds and layers
  contextBounds = createContextBounds(width, height);
  patternContext = new Context(contextBounds[PTTRN_CONTEXT][0],
    contextBounds[PTTRN_CONTEXT][1],
    contextBounds[PTTRN_CONTEXT][2],
    contextBounds[PTTRN_CONTEXT][3], "Pattern");
  mainContext = new Context(contextBounds[MAIN_CONTEXT][0],
    contextBounds[MAIN_CONTEXT][1],
    contextBounds[MAIN_CONTEXT][2],
    contextBounds[MAIN_CONTEXT][3], "Main");
  supportContext = new Context(contextBounds[SUPP_CONTEXT][0],
    contextBounds[SUPP_CONTEXT][1],
    contextBounds[SUPP_CONTEXT][2],
    contextBounds[SUPP_CONTEXT][3], "Support");

  patternContext.addStream(new ParticleStream());
  mainContext.addStream(new ParticleStream());
  supportContext.addStream(new ParticleStream());

  swatch = new Swatch(0, height - 100, 20, 20, currentPalette, targetPalette);
  
  oscP5 = new OscP5(this, oscPort);
  spoutA = new Spout(this);
  spoutB = new Spout(this);
  spoutC = new Spout(this);

  barkInit();

  // GIVE THE SENDER A NAME
  spoutA.setSenderName("patternPGSpout");
  spoutB.setSenderName("mainPGSpout");
  spoutC.setSenderName("supportPGSpout");
}

void draw() {
  // pattern context
  // fill(currentPalette[1]);
  // rect(contextBounds[PTTRN_CONTEXT][0],
  //      contextBounds[PTTRN_CONTEXT][1],
  //      contextBounds[PTTRN_CONTEXT][2],
  //      contextBounds[PTTRN_CONTEXT][3]);

  // // main context
  // rect(contextBounds[MAIN_CONTEXT][0],
  //      contextBounds[MAIN_CONTEXT][1],
  //      contextBounds[MAIN_CONTEXT][2],
  //      contextBounds[MAIN_CONTEXT][3]);

  // // support context
  // rect(contextBounds[SUPP_CONTEXT][0],
  //      contextBounds[SUPP_CONTEXT][1],
  //      contextBounds[SUPP_CONTEXT][2],
  //      contextBounds[SUPP_CONTEXT][3]);


  // testFunc();
  patternContext.update();
  patternContext.display();
  mainContext.update();
  mainContext.display();
  supportContext.update();
  supportContext.display();

  // Broadcasts the current PGraphics texture to other Spout-enabled apps
  spoutA.sendTexture(patternContext.graphics);
  spoutB.sendTexture(mainContext.graphics);
  spoutC.sendTexture(supportContext.graphics);

  if (frameCount % 40 == 0) {
    // println("FPS: " + int(frameRate));
    println("frame count: " + frameCount);

    paletteEqual = Arrays.equals(currentPalette, targetPalette);

    if (paletteEqual == false) {
      int clrIndex = getRandomColorIndex(currentPalette);
      currentPalette[clrIndex] = lerpColor(currentPalette[clrIndex], targetPalette[clrIndex], 0.15);
      if (abs(red(currentPalette[clrIndex]) - red(targetPalette[clrIndex])) < 10 &&
        abs(green(currentPalette[clrIndex]) - green(targetPalette[clrIndex])) < 10 &&
        abs(blue(currentPalette[clrIndex]) - blue(targetPalette[clrIndex])) < 10) {
        currentPalette[clrIndex] = targetPalette[clrIndex];
      }
    }
  }
  if (frameCount % 120 == 0) {
    swatch.updateCurrent(currentPalette);
    swatch.display();
  }
  if (frameCount % 2400 == 0) {
    int urlIndex = int(random(urls.length));
    targetPalette = createPalette(urls[urlIndex]);
    swatch.updateTarget(targetPalette);
  }
}
