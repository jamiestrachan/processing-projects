int R1, R2, G1, G2, B1, B2;

void setup() {
  size(640, 640);
  background(255);
  //noLoop();
}

void draw() {
  int boxes = 8;
  int boxw = width/boxes;
  int boxh = height/boxes;
  
  R1 = int(random(255));
  R2 = int(random(255));
  G1 = int(random(255));
  G2 = int(random(255));
  B1 = int(random(255));
  B2 = int(random(255));

  for (int x = 0; x < width; x += boxw) {
    for (int y = 0; y < height; y += boxh) {
      drawBox(x, y, boxw, boxh);
    }
  }
  delay(5000);
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
  int Ra, Ga, Ba, Rb, Gb, Bb;
  if (coinFlip()) { //first colour is colour 1?
    Ra = R1;
    Ga = G1;
    Ba = B1;
    Rb = R2;
    Gb = G2;
    Bb = B2;
  } else {
    Ra = R2;
    Ga = G2;
    Ba = B2;
    Rb = R1;
    Gb = G1;
    Bb = B1;
  }
  
  if (coinFlip()) { // background?
    fill(Ra, Ga, Ba);
  } else {
    fill(255);
  }
  rect(x, y, w, h);
  
  fill(Rb, Gb, Bb);
  
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
