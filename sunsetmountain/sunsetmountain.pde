// create a kind of contour map like my phone background
// start with a basically straight horizontal line at the bottom of the canvas
// each new line starts slightly higher than the last line and traverses the canvas horizontally
// there is minor deviation introduced as the line is drawn so it's not exactly like the one below
// basically keep an "average" distance between the new line and the one below but vary it randomly in a range around that average
// inspired by https://wallpapers.com/background/outrun-background-shc6gktszq7irin3.html

void setup() {
  size(400, 400);
  noFill();
  smooth();
  background(0);
}

void draw() {
  beginShape();
  vertex(0,  0);
  vertex(100,  100);
  vertex(200,  0);
  vertex(400,  400);
  endShape();
}
