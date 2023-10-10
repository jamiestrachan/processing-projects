// copied from https://forum.processing.org/one/topic/how-to-make-the-outline-glowing.html

void setup(){
  size(200,200);
  smooth();
  background(0);
  noStroke();
  fill(255,0,0);
  ellipse(100,100,95,95);
  filter( BLUR, 6 );
  stroke(0);
  fill(255,255,0);
  ellipse(100,100,90,90);
}

void draw(){}
