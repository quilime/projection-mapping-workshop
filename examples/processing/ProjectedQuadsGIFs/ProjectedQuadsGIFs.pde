/*
  Projected Quads with GIF support.
  Library Required.
  Add "GIF Animation" library from "Sketch > Import Library" 
    
  Keyboard:
  - 'SPACE' toggle debug mode
  - 's' save settings
  - 'l' load settings
  - '>' select next quad in debug mode
  - '<' select prev quad in debug mode
  - '1', '2', '3', '4' select one of selected quad's corners 
  - Arrow keys (left, right, up, down) move selected corner's position (you can also use mouse for that)  
*/

 
String configFile = "data/quadsconfig.txt";

ProjectedQuads projectedQuads;
PImage    quadImage;  
PGraphics quadGraphics;
import gifAnimation.*;
PImage[] animation;

Gif loopingGif0;
Gif loopingGif1;
Gif loopingGif2;
Gif loopingGif3;
Gif loopingGif4;

void setup() {
   size(displayWidth, displayHeight, P3D);
   
  projectedQuads = new ProjectedQuads();  
  projectedQuads.load(configFile);  
  //we want to display 3 quads so if there was no config file
  //or less than 3 were defined we increase number to 3
  if (projectedQuads.getNumQuads() < 5) {
    projectedQuads.setNumQuads(5);  
  }  
  
  loadGifs(); 
 
}

void loadGifs() {
  loopingGif0 = new Gif(this, "0.gif");
  loopingGif0.loop();
  loopingGif1 = new Gif(this, "1.gif");
  loopingGif1.loop();
  loopingGif2 = new Gif(this, "2.gif");
  loopingGif2.loop();
  loopingGif3 = new Gif(this, "3.gif");
  loopingGif3.loop();
  loopingGif4 = new Gif(this, "4.gif");
  loopingGif4.loop();  
  
  projectedQuads.getQuad(0).setTexture(loopingGif0);
  projectedQuads.getQuad(1).setTexture(loopingGif1); 
  projectedQuads.getQuad(2).setTexture(loopingGif2);  
  projectedQuads.getQuad(3).setTexture(loopingGif3); 
  projectedQuads.getQuad(4).setTexture(loopingGif4);    
}

void draw() {
  background(0);
  
  //draw projected quads on the screen
  projectedQuads.draw();
}

void keyPressed() {
  //let projectedQuads handle keys by itself
  projectedQuads.keyPressed();
  
  if (key == 'r') {
   loadGifs(); 
  }
  
}

void mousePressed() {
  //let projectedQuads handle mousePressed by itself
  projectedQuads.mousePressed();
}

void mouseDragged() {
  //let projectedQuads handle mouseDragged by itself
  projectedQuads.mouseDragged();
}

