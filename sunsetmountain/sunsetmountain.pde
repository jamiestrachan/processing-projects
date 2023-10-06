// create a kind of contour map like my phone background
// start with a basically straight horizontal line at the bottom of the canvas
// each new line starts slightly higher than the last line and traverses the canvas horizontally
// there is minor deviation introduced as the line is drawn so it's not exactly like the one below
// basically keep an "average" distance between the new line and the one below but vary it randomly in a range around that average
// inspired by https://wallpapers.com/background/outrun-background-shc6gktszq7irin3.html

int steps = 10;
int startFromBottom = 20;
float variance = 15;

int startY;

float vary(int mid, float range) {
  return random(mid-range, mid+range);
  //return(mid + (randomGaussian() * range));
}

float vary(float mid, float range) {
  return random(mid-range, mid+range);
  //return(mid + (randomGaussian() * range));
}

void setup() {
  size(400, 400);
  noFill();
  smooth();
  background(0);
  stroke(255);
  strokeWeight(2);
  
  startY = height - startFromBottom;
}

void jagged_line() {
  beginShape();
  for (int x = 0; x <= width; x+=10) {
    vertex(x, vary(startY, variance));
  }
  endShape();
}

void one_vector_line() {
  Contour c = new Contour(steps, variance);
  
  c.display();
}

void many_vector_lines(int count) {
  Contour firstLine = new Contour(steps, variance);
  firstLine.display();
  
  Contour prevLine = firstLine;
  for (int i = 1; i < count; i++) {
    float newVariance = variance - (float(i)/5);
    Contour newLine = new Contour(prevLine, startFromBottom, newVariance); 
    newLine.display();
    prevLine = newLine;
  }
}

void draw() {
  background(0);
 
  //jagged_line();
  one_vector_line();
  //many_vector_lines(10);
  
  delay(2000);
}
