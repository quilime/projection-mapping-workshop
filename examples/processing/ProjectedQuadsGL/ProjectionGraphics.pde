class ProjectionGraphics {
  
  // a wrapper for various graphics intended to be textured
  // onto quads
  public ProjectionGraphics() {
  }
  
  // stripes by MarcinIgnac
  public void marcinStripes(PGraphics buffer) {
    // draw some animation code on buffer
    buffer.beginDraw();
    buffer.background(0, 00255);
    buffer.stroke(255);
    buffer.strokeWeight(10);
    buffer.noFill();
    buffer.rect(0, 0, buffer.width, buffer.height);
    buffer.noStroke();
    buffer.strokeWeight(3);
    buffer.fill(255);
    float[] speeds = {1, 1.25, 1.5, 2.0, 2.5, 3};
    for(int i=0; i<speeds.length; i++) {
      float x = buffer.width * (0.5 + 0.5 * sin(frameCount/100.0*speeds[i]));
      buffer.rect(x, 0, 10*speeds[i], buffer.height);  
    }
    buffer.endDraw();  
  }
  
}
