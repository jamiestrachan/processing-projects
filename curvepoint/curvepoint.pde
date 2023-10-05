size(400,400);

noFill();
stroke(255,0,0);
curve(20, 104, 20, 104, 292, 96, 292, 244);
stroke(0,255,0);
curve(20, 104, 292, 96, 292, 244, 60, 260);
stroke(0,0,255);
curve(292, 96, 292, 244, 60, 260, 1, 1); 

fill(255);
stroke(0);
ellipseMode(CENTER);
int steps = 2;

for (int i = 0; i <= steps; i++) {
  float t = i / float(steps);
  float x = curvePoint(20, 20, 292, 292, t);
  float y = curvePoint(104, 104, 96, 244, t);
  fill(255,0,0);
  ellipse(x, y, 10, 10);
  x = curvePoint(20, 292, 292, 60, t);
  y = curvePoint(104, 96, 244, 260, t);
  fill(0,255,0);
  ellipse(x, y, 10, 10);
  x = curvePoint(292, 292, 60, 1, t);
  y = curvePoint(96, 244, 260, 1, t);
  fill(0,0,255);
  ellipse(x, y, 10, 10);
}
