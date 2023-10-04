//trying out the gifAnimation library
//using instructions from https://stackoverflow.com/questions/22124039/exporting-a-gif-from-a-processing-sketch-w-gif-animation-library/22133355#22133355

import gifAnimation.*;

GifMaker gifExport;

float angle = 0.1;

void setup() {
  size(500, 500);
  smooth();
  noStroke();
  background(0);

  frameRate(12);
  gifExport = new GifMaker(this, "spin rect sine growth.gif");
  gifExport.setRepeat(0); // make it an "endless" animation
  gifExport.setTransparent(255); // make white the transparent color -- match browser bg color
  gifExport.setDelay(1000/12);  //12fps in ms
}

void draw() {
  float size = map(sin(angle),-1,1,0,height);
  rectMode(CENTER);
  translate(width/2, height/2);
  rotate(angle);
  noStroke();
  fill(255,255);
  rect(0,0, size, size);
  angle += 0.0523 ;

  noStroke();
  fill(0, 15);
  rect(0, 0, width, height);

  gifExport.addFrame();

  if (frameCount == 120) gifExport.finish();  
}
