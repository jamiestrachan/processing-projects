class Contour {
  private PVector[] points;
  private int pointCount;
  
  Contour (int pc, float variance) {
    pointCount = pc;
    points = new PVector[pointCount];
    for (int i = 0; i < pointCount-1; i++) {
      points[i] = new PVector (i * (width/pointCount-1), vary(height-variance, variance));
    }
    points[pointCount-1] = new PVector (width, vary(height-variance, variance));
  }
  
  Contour (Contour c, float separation, float variance) {
    pointCount = c.getPointCount();
    points = new PVector[pointCount];
    for (int i = 0; i < pointCount; i++) {
      points[i] = new PVector (c.pointNumber(i+1).x, vary(c.pointNumber(i+1).y - (separation * sin(map(i,0,pointCount-1,QUARTER_PI,3*QUARTER_PI)) ), variance  ));
    }
  }
  
  PVector pointNumber(int i) {
    return points[i-1];
  }
  
  void display() {
    beginShape();
    curveVertex(points[0].x, points[0].y);
    curveVertex(points[0].x, points[0].y);
    curveVertex(points[1].x, points[1].y);
    curveVertex(points[2].x, points[2].y);
    endShape();
      
    for (int i = 0; i < pointCount - 3; i++) {
      beginShape();
      curveVertex(points[i].x, points[i].y);
      curveVertex(points[i + 1].x, points[i + 1].y);
      curveVertex(points[i + 2].x, points[i + 2].y);
      curveVertex(points[i + 3].x, points[i + 3].y);
      endShape();
    }
  
    beginShape();
    curveVertex(points[pointCount-3].x, points[pointCount-3].y);
    curveVertex(points[pointCount-2].x, points[pointCount-2].y);
    curveVertex(points[pointCount-1].x, points[pointCount-1].y);
    curveVertex(points[pointCount-1].x, points[pointCount-1].y);
    endShape();
  }
  
  void display(PGraphics pg) {
    pg.beginShape();
    pg.curveVertex(points[0].x, points[0].y);
    pg.curveVertex(points[0].x, points[0].y);
    pg.curveVertex(points[1].x, points[1].y);
    pg.curveVertex(points[2].x, points[2].y);
    pg.endShape();
      
    for (int i = 0; i < pointCount - 3; i++) {
      pg.beginShape();
      pg.curveVertex(points[i].x, points[i].y);
      pg.curveVertex(points[i + 1].x, points[i + 1].y);
      pg.curveVertex(points[i + 2].x, points[i + 2].y);
      pg.curveVertex(points[i + 3].x, points[i + 3].y);
      pg.endShape();
    }
  
    pg.beginShape();
    pg.curveVertex(points[pointCount-3].x, points[pointCount-3].y);
    pg.curveVertex(points[pointCount-2].x, points[pointCount-2].y);
    pg.curveVertex(points[pointCount-1].x, points[pointCount-1].y);
    pg.curveVertex(points[pointCount-1].x, points[pointCount-1].y);
    pg.endShape();
  }
  
  int getPointCount() {
    return pointCount;
  }
}
