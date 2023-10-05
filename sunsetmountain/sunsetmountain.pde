// create a kind of contour map like my phone background
// start with a basically straight horizontal line at the bottom of the canvas
// each new line starts slightly higher than the last line and traverses the canvas horizontally
// there is minor deviation introduced as the line is drawn so it's not exactly like the one below
// basically keep an "average" distance between the new line and the one below but vary it randomly in a range around that average
// inspired by https://wallpapers.com/background/outrun-background-shc6gktszq7irin3.html

void setup() {
  size(400, 400);
  noFill();
  noLoop();
  smooth();
  background(0);
}

float vary(int mid, int range) {
  return random(mid-range, mid+range);
  //return(mid + (randomGaussian() * range));
}

void draw() {
  int startY = height-10;
  stroke(255);
  beginShape();
  for (int x = 0; x <= width; x+=10) {
    vertex(x, vary(startY, 2));
  }
  endShape();
}
