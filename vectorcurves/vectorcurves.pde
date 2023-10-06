// based on code from https://forum.processing.org/two/discussion/17249/smooth-curves-from-series-of-x-y-co-ordinates.html
int num = 15;
PVector[] points = new PVector[num];

void setup() {
  size(300, 300);
  background(240, 140, 160);

  for (int i = 0; i < num; i++) {
    points[i] = new PVector (random(width), random(height));
  }
}

void draw() {
  noFill();
  strokeWeight(10);
  strokeCap(SQUARE);

  for (int i = 0; i < num - 3; i++) {
    stroke(255/num * i);

    //see that you need at least four points to draw a curve
    //the first and last being handles which determine the curve of the curve
    beginShape();
    curveVertex(points[i].x, points[i].y);
    curveVertex(points[i + 1].x, points[i + 1].y);
    curveVertex(points[i + 2].x, points[i + 2].y);
    curveVertex(points[i + 3].x, points[i + 3].y);
    endShape();
  }

  //so that you can see where the points are
  noStroke();
  fill(110, 30, 0);
  for (int i = 0; i < num; i++) {
    ellipse(points[i].x, points[i].y, 5, 5);
  }
}  
