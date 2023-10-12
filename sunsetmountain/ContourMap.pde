class ContourMap {
  private Contour[] contours;
  
  ContourMap (int contourCount, int segmentCount, float separation, float variance, float totalDecay) {
    contours = new Contour[contourCount];
    
    contours[0] = new Contour(segmentCount, variance);
    for (int i = 1; i < contourCount; i++) {
      float decay = totalDecay / contourCount;
      contours[i] = new Contour(contours[i-1], separation * (1-(decay*i)), variance * (1-(decay*i)));
    }
  }
  
  void display(PGraphics pg) {
    for (int i = 0; i < contours.length; i++) {
      contours[i].display(pg);
    }
  }
}
