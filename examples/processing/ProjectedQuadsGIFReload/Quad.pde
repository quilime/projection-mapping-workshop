/*
  ProjectedQuads / Quads.pde 
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
 
class Quad {
  private PVector[] points;
  private PImage texture;
  private boolean mirrored = false;
  
  public Quad() {
    points = new PVector[4];
    points[0] = new PVector(width/4, height/4);
    points[1] = new PVector(width/4*2, height/4);
    points[2] = new PVector(width/4*2, height/4*2);
    points[3] = new PVector(width/4, height/4*2);
  }
  
  public PVector[] getPoints() {
    return points;
  }
  
  public PImage getTexture() {
    return texture;
  }
  
  public void setTexture(PImage texture) {
    this.texture = texture;
  }
  
  
  public boolean isMirrored() {
    return mirrored;
  }
  
  public void setMirrored(boolean mirrored) {
    this.mirrored = mirrored;
  } 
  
  public PVector getCenterPoint() {
    return new PVector(
      (points[0].x + points[1].x + points[2].x + points[3].x)/4, 
      (points[0].y + points[1].y + points[2].y + points[3].y)/4
    );
  } 
}
