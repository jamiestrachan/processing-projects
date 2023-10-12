// create a kind of contour map like my phone background
// start with a basically straight horizontal line at the bottom of the canvas
// each new line starts slightly higher than the last line and traverses the canvas horizontally
// there is minor deviation introduced as the line is drawn so it's not exactly like the one below
// basically keep an "average" distance between the new line and the one below but vary it randomly in a range around that average
// inspired by https://wallpapers.com/background/outrun-background-shc6gktszq7irin3.html

int segments = 15; // more segments, wavier line
int separation = 40; // distance between lines
float variance = 20; // variance applied to separation; less variance, more consistency in separation
float totalDecay = 0.8; // decay applied to separation to have lines get closer together as they are drawn

color lineColor = color(225,75,255);
color glowColor = color(255);
float glowBlur = 2;

PGraphics mountain, sun;

float vary(int mid, float range) {
  return random(mid-range, mid+range);
}

float vary(float mid, float range) {
  return random(mid-range, mid+range);
}

void setup() {
  // establish canvas
  size(800, 800);
  background(0);
  
  // set up the sun layer
  sun = createGraphics(200, 200);
  sun.smooth();
  // we only draw the sun once so can do it here in setup()
  drawSun(sun);
  
  // we'll redraw the mountain with each draw() so just set up the layer for now
  mountain = createGraphics(width, height);
  mountain.smooth();
}

void drawSun(PGraphics pg) { // draw the sun to the layer
  pg.beginDraw();
  
  pg.stroke(0);
  pg.fill(255,239,0);
  pg.ellipse(pg.width * 0.5, pg.height * 0.5, pg.width, pg.height);
  
  pg.endDraw();
}

void drawMountain(PGraphics pg, ContourMap cm) { // draw the mountain to the layer
  pg.beginDraw();
  
  pg.background(0, 0); // need to clear the canvas but still want it to be transparent. Apparently black with 0 alpha works??
  pg.noFill();
  pg.strokeWeight(2);
  
  // first pass is for glow effect
  pg.stroke(glowColor);
  cm.display(pg);
  pg.filter(BLUR, glowBlur);
  pg.filter(DILATE);
  pg.filter(DILATE);
  
  // second pass is for solid lines
  pg.stroke(lineColor);
  cm.display(pg);
  
  pg.endDraw();
}

void draw() { // each draw() resets the canvas, generates a new ContourMap, draws it, then places the sun and mountain layers
  
  background(0);
   
  ContourMap cm = new ContourMap(20, segments, separation, variance, totalDecay);
  drawMountain(mountain, cm);

  image(sun, (width * 0.5) - (sun.width * 0.5), 75);
  image(mountain, 0, 0);
  
  delay(2000);
}
