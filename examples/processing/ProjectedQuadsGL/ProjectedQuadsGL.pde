import processing.video.*;
import javax.media.opengl.GL2;
GL2 gl;

/*
  ProjectedQuads - a simple class for projection mapping
  Copyright (c) 2010 Marcin Ignac http://marcinignac.com  

  ProjectedQuads / ProjectedQuadsTest.pde
  v1.0 / 2010.01.30  

  Modified 2014 Gabriel Dunne http://gabrieldunne.com
     - Enabled OPENGL Support
     - Cleaned up main
     - Changed some key commands
  
  Keyboard:
  'SPACE' toggle debug mode
  's' save settings
  'l' load settings
  '.' select next quad in debug mode
  ',' select prev quad in debug mode
  '1', '2', '3', '4' select one of selected quad's corners 
  Arrow keys move selected corner's position (you can also use mouse)  
*/

// video capture
Capture cam;

// configuration file location
String configFile = "data/quadsconfig.txt";

// projected quads
ProjectedQuads quads;

// a set of graphics routines
ProjectionGraphics graphics;

// shaders
PShader bwShader;

// graphics buffers 
PGraphics stripes, video;

void setup() {
  
  size(displayWidth, displayHeight, OPENGL);
  gl = ((PJOGL)beginPGL()).gl.getGL2();
  
  quads = new ProjectedQuads();  
  graphics = new ProjectionGraphics();
  
  // create 5 quads
  quads.setNumQuads(5);  
   
  // map an image to quad 0
  quads.getQuad(0).setTexture(loadImage("checker.png"));
  
  // create some graphics for quad 1  
  stripes = createGraphics(256, 256, OPENGL);
  quads.getQuad(1).setTexture(stripes); 
   
  // set another image to quad 2
  quads.getQuad(2).setTexture(loadImage("suchmapping.jpeg"));
  
  // mirror quad 4
  quads.getQuad(4).setMirrored(true);
  
  // set up camera for capture
  String[] cameras = Capture.list();
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
    // The camera can be initialized directly using an 
    // element from the array returned by list():
    cam = new Capture(this, cameras[0]);
    cam.start();     
  } 
}

void draw() {

  // draw texture buffers
  graphics.marcinStripes(stripes);
  
  // draw projected quads on the screen
  background(0);  
  
  // draw video buffers from camera
  if (cam.available() == true) {
    cam.read();
  }
  quads.getQuad(3).setTexture(cam);
  quads.getQuad(4).setTexture(cam);

  quads.draw();
}

void keyPressed() {
  
  // give a keypressed event to quads
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
  }  
}

void mousePressed() {
  // let quads handle its own mousePressed
  quads.mousePressed();
}

void mouseDragged() {
  // let quads handle its own mouseDragged
  quads.mouseDragged();
}

