/*  

  Keyboard Commands:
  
  'SPACE' toggle debug mode
  's' save settings
  'l' load settings
  '.' select next quad in debug mode
  ',' select prev quad in debug mode
  '1', '2', '3', '4' select one of selected quad's corners 
  Arrow keys move selected corner's position (you can also use mouse)  

*/

import processing.video.*;
import javax.media.opengl.GL2;
GL2 gl;

String configFile = "data/quadsconfig.txt";

ProjectedQuads quads;

Movie movie0, 
      movie1, 
      movie2;

void setup() {
  size(displayWidth, displayHeight, OPENGL);
  quads = new ProjectedQuads(3);
  
  movie0 = new Movie(this, "sample0.mov");
  movie0.loop();
  quads.getQuad(0).setTexture(movie0);

  movie1 = new Movie(this, "sample1.mov");
  movie1.loop();
  quads.getQuad(1).setTexture(movie1);  

  movie2 = new Movie(this, "sample2.mov");
  movie2.loop();
  quads.getQuad(2).setTexture(movie2);   
}


void draw() {    
  background(0);
  quads.draw(); 
}


// draw image graphics to a buffer
void imageTex(PGraphics buffer, Movie image) {
  buffer.beginDraw();
  buffer.background(0);
  buffer.set(0, 0, image);
  buffer.endDraw(); 
}


// draw movie graphics to a buffer
void movieTex(PGraphics buffer, PImage image) {
  buffer.beginDraw();
  buffer.background(0);
  buffer.set(0, 0, image);
  buffer.endDraw(); 
}


void keyPressed() {
  quads.keyPressed();
  if (key == 's') {
    quads.save(configFile);
  }
  if (key == 'l') {
    quads.load(configFile);
  }
  if (key == ' ') {
    // toggle debug/design/setup mode
    quads.setDebugMode(!quads.getDebugMode());
    if (quads.getDebugMode()) {
      cursor();
    } else {
      noCursor();
    }
  }  
}

void mousePressed() {
  quads.mousePressed();
}

void mouseDragged() {
  quads.mouseDragged();
}

void movieEvent(Movie m) {
  m.read();
}

