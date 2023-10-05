int R1, R2, G1, G2, B1, B2;
color c1, c2;

void setup() {
  size(640, 640);
  background(255);
}

void draw() {
  int boxes = 8;
  int boxw = width/boxes;
  int boxh = height/boxes;
  
  c1 = color(random(255), random(255), random(255));
  c2 = color(random(255), random(255), random(255));

  for (int x = 0; x < width; x += boxw) {
    for (int y = 0; y < height; y += boxh) {
      drawBox(x, y, boxw, boxh);
    }
  }
  delay(1000);
}

boolean coinFlip() {
  if (random(1) > 0.5) {
    return true;
  }
  return false;
}

float randomRGB(int start, int range) {
  float rand = random(range);
  if (coinFlip()) {
    return start + rand;
  } else {
    return start - rand;
  }
}

void drawBox(int x, int y, int w, int h) {
  color primary, secondary;
  
  if (coinFlip()) { //first colour is colour 1?
    primary = c1;
    secondary = c2;
  } else {
    primary = c2;
    secondary = c1;
  }
  
  if (coinFlip()) { // background?
    fill(primary);
  } else {
    fill(255);
  }
  rect(x, y, w, h);
  
  fill(secondary);
  
  if (coinFlip()) { // triangle?
    if (coinFlip()) { // from top left?
      if (coinFlip()) { // top triangle?
        triangle(x, y, x+w, y, x+w, y+h);
      } else {     
        triangle(x, y, x, y+h, x+w, y+h);
      }
    } else { // from top right
      if (coinFlip()) { // top triangle?
        triangle(x, y, x+w, y, x, y+h);
      } else {
        triangle(x+w, y, x+w, y+h, x, y+h);
      }
    }
  }
}
