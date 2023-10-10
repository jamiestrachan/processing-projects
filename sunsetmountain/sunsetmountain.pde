// create a kind of contour map like my phone background
// start with a basically straight horizontal line at the bottom of the canvas
// each new line starts slightly higher than the last line and traverses the canvas horizontally
// there is minor deviation introduced as the line is drawn so it's not exactly like the one below
// basically keep an "average" distance between the new line and the one below but vary it randomly in a range around that average
// inspired by https://wallpapers.com/background/outrun-background-shc6gktszq7irin3.html

int segments = 15; // more segments, wavier line
int separation = 40; // distance between lines
float variance = 20; // variance applied to separation; less variance, more consistency in separation
float totalDecay = 0.80; // decay applied to separation to have lines get closer together as they are drawn

color lineColor = color(225,75,255);
color glowColor = color(255);
int glowBlur = 2;

int startY;

float vary(int mid, float range) {
  return random(mid-range, mid+range);
}

float vary(float mid, float range) {
  return random(mid-range, mid+range);
}

void setup() {
  size(800, 800);
  noFill();
  smooth();
  background(0);
  stroke(glowColor);
  strokeWeight(2);
  
  startY = height - separation;
}

void jagged_line() {
  beginShape();
  for (int x = 0; x <= width; x+=10) {
    vertex(x, vary(startY, variance));
  }
  endShape();
}

void one_vector_line() {
  Contour c = new Contour(segments, variance);
  
  c.display();
}

void many_vector_lines(int count) {
  Contour[] contours = new Contour[count];
  

  stroke(glowColor);
  
  contours[0] = new Contour(segments, variance);
  contours[0].display();
  
  for (int i = 1; i < count; i++) {
    float decay = totalDecay / count;
    contours[i] = new Contour(contours[i-1], separation * (1-(decay*i)), variance * (1-(decay*i))); 
    contours[i].display();
  }
  

  filter( BLUR, glowBlur );
  stroke(lineColor);
  
  for (int i = 0; i < count; i++) {
    contours[i].display();
  }
  
  stroke(0);
  fill(255,239,0);
  ellipse(width/2, 175, 250, 250);
  noFill();
  

}

void draw() {
  background(0);
 
  //jagged_line();
  //one_vector_line();
  many_vector_lines(20);
  
  // painting process
    // set up contours
    // set up sun

  
  delay(2000);
}
