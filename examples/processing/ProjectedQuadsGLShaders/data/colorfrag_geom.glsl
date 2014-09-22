#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

varying vec4 vertColor;

// via http://glsl.heroku.com/e#19352.2
//Author: Evan Palmer

uniform float time;
uniform vec2 resolution;
uniform vec2 mouse;

void main( void ) {
  
  float scale = 0.4;
  float t = time * scale;
  
  vec2 pos = ( gl_FragCoord.xy / resolution.xy );
    
  vec4 c;
  c.x = fract(pos.y-t);
  c.y = fract(pos.x-t);;
  c.z = fract(pos.x+pos.y-t);
  c.w = 1.0;
  
  vec2 revPos;
  revPos.x = -pos.x;
  revPos.y = pos.y;
  c.x = c.y + -fract(revPos.y-t);
  c.y = c.z + -fract(revPos.x-t);;
  c.z = c.x + fract(revPos.x-revPos.y-t);
  
  
  gl_FragColor = c;
}
