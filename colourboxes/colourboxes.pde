int startR, startG, startB, spread;

void setup() {
  size(640, 640);
  background(255);
  //noLoop();
}

void draw() {
  int boxes = 8;
  int boxw = width/boxes;
  int boxh = height/boxes;
  
  startR = int(random(255));
  startG = int(random(255));
  startB = int(random(255));
  spread = 50;

  for (int x = 0; x < width; x += boxw) {
    for (int y = 0; y < height; y += boxh) {
      drawBox(x, y, boxw, boxh);
    }
  }
  delay(1000);
}

float randomRGB(int start, int range) {
  float rand = random(range);
  if (rand % 2 == 0) {
    return start + rand;
  } else {
    return start - rand;
  }
}

void drawBox(int x, int y, int w, int h) {
  fill(randomRGB(startR, spread), randomRGB(startG, spread), randomRGB(startB, spread));
  rect(x, y, w, h);
}
