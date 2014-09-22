/*
  ProjectedQuads / ProjectedQuads.pde 
  v1.0 / 2010.01.30
*/

/* 
 * Copyright (c) 2010 Marcin Ignac http://marcinignac.com
 * 
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 * 
 * http://creativecommons.org/licenses/LGPL/2.1/
 * 
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
 */
 
class ProjectedQuads {
  private ArrayList quads;
  private boolean debugMode = true;
  private int selectedQuad = 0;
  private int selectedPoint = 0;  
  private float numSubdivisions = 5;
  PFont debugFont;
  
  public ProjectedQuads(int num) {
    quads = new ArrayList();
    debugFont = createFont("Arial", 64);
    setNumQuads(num);
  }
  
  public boolean getDebugMode() {
    return debugMode;
  }
  
  public void setDebugMode(boolean debugMode) {
    this.debugMode = debugMode;
  }
  
  public void setNumQuads(int num) {
    while(quads.size() > num) {
      quads.remove(quads.size()-1);
    }
    while(quads.size() < num) {
      quads.add(new Quad());
    }
    selectedQuad = quads.size()-1;
  }
  
  public int getNumQuads() {
    return quads.size();
  }
  
  public Quad getQuad(int i) {
    return (Quad)quads.get(i);
  }
  
  public void load(String configFile) {
    String[] data = loadStrings(configFile);
    if (data == null) {
      return;
    }
    setNumQuads(data.length);
    for(int i=0; i<data.length; i++) {
      PVector[] points = ((Quad)quads.get(i)).getPoints();
      String[] lineArr = data[i].split(" ");
      for(int j=0; j<4; j++) {
        points[j].x = parseFloat(lineArr[j*2]);
        points[j].y = parseFloat(lineArr[j*2+1]);
      }    
    }
    println("ProjectedQuads loaded from: " + configFile);
  }
  
  public void save(String configFile) {
    String data = "";
    for(int i=0; i<quads.size(); i++) {
      PVector[] points = ((Quad)quads.get(i)).getPoints();
      for(int j=0; j<4; j++) {
        data += points[j].x + " " + points[j].y;
        if (j < 3) data += " ";
      }
      if (i < quads.size()-1) data += "\n";
    }
    saveStrings(configFile, data.split("\n"));
    println("ProjectedQuads saved to: " + configFile);
  }
      
  
  //draw all the quads
  public void draw() {    
    if (debugMode) {
      textFont(debugFont);
    }
    
    for(int i=0; i<quads.size(); i++) {    
      if (debugMode) {
        if (i == selectedQuad) {
          stroke(255, 0, 0, 255);
        }
        else {
          stroke(255, 0, 0, 50);
        }
      }
      else {
        noStroke();
      }    
      beginShape(QUADS);   
      Quad q = (Quad)quads.get(i);
      texture(q.getTexture());
      
      for(int x=0; x<numSubdivisions; x++) {
        for(int y=0; y<numSubdivisions; y++) {
          calcVertex(q, x/numSubdivisions, y/numSubdivisions);
          calcVertex(q, (x+1)/numSubdivisions, y/numSubdivisions);
          calcVertex(q, (x+1)/numSubdivisions, (y+1)/numSubdivisions);
          calcVertex(q, x/numSubdivisions, (y+1)/numSubdivisions);
        }
      }
      endShape();
      if (debugMode) {
        PVector center = q.getCenterPoint();
        
        fill(0, 0, 0);  
        text(""+i, center.x-22, center.y+22);           
        
        if (i == selectedQuad) {
            fill(0, 255, 0);  
        }
        else {
            fill(255, 0, 0);
        }
        
        text(""+i, center.x-20, center.y+20);    
      }
    }
    
    if (debugMode) {
      drawAnchors();
    }
  }  
  
  //calculates vertex for sub quads
  public void calcVertex(Quad q, float sx, float sy) {
    PVector[] points = q.getPoints();
    float tx = points[0].x + (points[1].x - points[0].x)*sx;
    float ty = points[0].y + (points[1].y - points[0].y)*sx;        
    float bx = points[3].x + (points[2].x - points[3].x)*sx;
    float by = points[3].y + (points[2].y - points[3].y)*sx;   
    float gw = q.getTexture().width;
    float gh = q.getTexture().height;    
  
    if(q.isMirrored()) {
      vertex(tx + (bx - tx) * sy, ty + (by - ty) * sy, gw-sx*gw, sy*gh);
    }
    else {
      vertex(tx + (bx - tx) * sy, ty + (by - ty) * sy, sx*gw, sy*gh);
    }  
  }
  
  public void drawAnchors() {
    stroke(255, 0, 0);
    rectMode(CENTER);   
    if (selectedQuad > -1) {    
      Quad q = (Quad)quads.get(selectedQuad);
      
      for(int i=0; i<4; i++) {  
        if (i == selectedPoint) {
          fill(0, 255, 0);
        }
        else {
          fill(255, 0, 0);
        }
        rect(q.getPoints()[i].x, q.getPoints()[i].y, 10, 10);
      }
    }
  }
  
  
  public void keyPressed() {
    if (selectedQuad > -1 && selectedPoint > -1) {
      PVector[] points = ((Quad)quads.get(selectedQuad)).getPoints();
      switch(keyCode) {
      case LEFT: 
        points[selectedPoint].x -= 1; 
        break;
      case RIGHT: 
        points[selectedPoint].x += 1; 
        break;
      case UP: 
        points[selectedPoint].y -= 1; 
        break;
      case DOWN: 
        points[selectedPoint].y += 1; 
        break;      
      }
    }
    
    if (key == '1') {
      selectedPoint = 0;
    }
    if (key == '2') {
      selectedPoint = 1;
    }
    if (key == '3') {
      selectedPoint = 2;
    }
    if (key == '4') {
      selectedPoint = 3;
    }
    if (key == ',') {
      selectedQuad = (selectedQuad - 1 + quads.size()) % quads.size();
    }
    if (key == '.') {
      selectedQuad = (selectedQuad + 1) % quads.size();
    }
  }
  
  public void mousePressed() {
    selectedPoint = -1;
    if (selectedQuad > -1) {
      PVector[] points = ((Quad)quads.get(selectedQuad)).getPoints();
      for(int i=0; i<4; i++) {
        if ((Math.abs(mouseX - points[i].x) < 10) && (Math.abs(mouseY - points[i].y) < 10)) {
          selectedPoint = i;
          break;
        }
      }
    }
  }
  
  public void mouseDragged() {
    if (selectedQuad > -1 && selectedPoint > -1) {
      PVector[] points = ((Quad)quads.get(selectedQuad)).getPoints();
      points[selectedPoint].x = mouseX;
      points[selectedPoint].y = mouseY;   
      //snapping
      for(int i=0; i<quads.size(); i++) {
        if (i == selectedQuad) continue;
        PVector[] otherPoints = ((Quad)quads.get(i)).getPoints();
        for(int j=0; j<4; j++) {
          if ((abs(otherPoints[j].x - points[selectedPoint].x) < 5) 
            && (abs(otherPoints[j].y - points[selectedPoint].y) < 5)) {
            points[selectedPoint].x = otherPoints[j].x;
            points[selectedPoint].y = otherPoints[j].y;
            break;
          }
        }
      }
    }
  }
  
  
  

}
