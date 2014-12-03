/*
  Keyboard Commands:
  'SPACE' toggle debug mode
  's' save settings
  'l' load settings
  'r' reload shaders
  '.' select next quad in debug mode
  ',' select prev quad in debug mode
  '1', '2', '3', '4' select one of selected quad's corners 
  Arrow keys move selected corner's position (you can also use mouse)  
*/

import processing.video.*;
import javax.media.opengl.GL2;
GL2 gl;

// configuration file location
String configFile = "data/quadsconfig.txt";

// projected quads
ProjectedQuads quads;

// graphics buffers 
PGraphics graphics1, 
          camGfx, 
          camShaderGfx, 
          imgShader,
          colorShaderGfx,
          colorShader2Gfx;

// shaders
PShader texShader, 
        bwShader,
        embossShader,
        edgesShader,
        colorShader,
        colorShader2;

void loadShaders() {
  edgesShader = loadShader("edgesfrag.glsl");
  texShader = loadShader("texfrag.glsl");
  bwShader = loadShader("bwfrag.glsl");
  embossShader = loadShader("embossfrag.glsl");
  colorShader = loadShader("colorfrag_ripples.glsl");
  colorShader2 = loadShader("colorfrag_trippy.glsl");
}

void setup() {
  size(displayWidth, displayHeight, OPENGL);
  
  // setup camera for video capture
  //setupCamCapture();
  
  // load shaders
  loadShaders();
  
  // create new set of quads
  quads = new ProjectedQuads(6);
   
  int shaderRes = 256;
  colorShaderGfx = createGraphics(shaderRes, shaderRes, OPENGL);
  
  quads.getQuad(0).setTexture(colorShaderGfx);
  quads.getQuad(1).setTexture(colorShaderGfx); 
  quads.getQuad(2).setTexture(colorShaderGfx);
  
  
  colorShader2Gfx = createGraphics(shaderRes, shaderRes, OPENGL);
  
  quads.getQuad(3).setTexture(colorShader2Gfx);
  quads.getQuad(4).setTexture(colorShader2Gfx);
  quads.getQuad(5).setTexture(colorShader2Gfx);
  
}

void draw() {  

  // update camera
  //readCamera();
  
  // shaders uniforms
  colorShader.set("time", (float)(millis() / 1000.0));
  colorShader.set("resolution", float(colorShaderGfx.width), float(colorShaderGfx.height));
  colorShader.set("mouse", float(mouseX), float(mouseY));
  
  colorShader2.set("time", (float)(millis() / 1000.0));
  colorShader2.set("resolution", float(colorShader2Gfx.width), float(colorShader2Gfx.height));
  colorShader2.set("mouse", float(mouseX), float(mouseY));  
  
  colorShader(colorShaderGfx, colorShader);
  colorShader(colorShader2Gfx, colorShader2);  

  background(0);
  
  
  
  //translate(displayWidth/2,displayHeight/2,0);
  //rotateY(frameCount * 0.01);
  //translate(-displayWidth/2,-displayHeight/2,0);
  quads.draw();
  
  
}





///////////////////////////////////////////////////////////////
// graphics routines
///////////////////////////////////////////////////////////////
// video capture
Capture cam;

///////////////////////////////////////////////////////////////
// setup external cameras
void setupCamCapture() {
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


// read camera if it's available
void readCamera() {
   // draw video buffers from camera
  if (cam.available() == true) {
    cam.read();
  } 
}


// draw image graphics to a buffer
void imageTex(PGraphics buffer, PImage image) {
  buffer.beginDraw();
  buffer.background(0);
  buffer.set(0, 0, image);
  buffer.endDraw(); 
}


// draw color shader to a buffer
void colorShader(PGraphics buffer, PShader shader) {
  buffer.beginDraw();
  buffer.background(0);
  buffer.shader(shader);
  buffer.rect(0,0,buffer.width, buffer.height);
  buffer.endDraw();
}


// draw texture graphics and shader to a buffer
void imageTexShader(PGraphics buffer, PImage image, PShader shader) {
  buffer.beginDraw();
  buffer.background(0);
  buffer.shader(shader);
  buffer.image(image, 0, 0);
  buffer.endDraw(); 
}


// stripes by marcin ignac
void marcinStripes(PGraphics buffer) {
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



///////////////////////////////////////////////////////////////
// interaction routines
///////////////////////////////////////////////////////////////
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
  if (key == 'r') {
    // reload shaders
    loadShaders();
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


