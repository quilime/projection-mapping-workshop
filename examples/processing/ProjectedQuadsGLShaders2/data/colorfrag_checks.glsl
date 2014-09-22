#ifdef GL_ES
precision mediump float;
#endif

// Took that weird bouncey wavey pseudo-3d code and 
// made it produce something that doesn't twist your brain.

#define PI 3.1415926535
uniform float time;
uniform vec2 mouse;
uniform vec2 resolution;
vec3 Check(vec2 pos) {
  float b = dot(sin(pos*2.), cos(pos*2.))<0.01?1.:0.;
  return vec3(b); 
}
vec2 Rotate(vec2 pos, float angle) {
  return vec2(cos(angle)*pos.x - sin(angle)*pos.y, sin(angle)*pos.x + cos(angle)*pos.y);
}
void main( void ) {
  vec2 uv = gl_FragCoord.xy/resolution.y*2.-1.;
  uv.x -= resolution.x/resolution.y*.5;
  uv += Rotate(uv, (time));
  vec2 pos = vec2(0., 0.);
  float y = abs(uv.y+sin(uv.x)/6.*(cos(3.)+1.) + sin((time*1.)*.01));
  pos.y = 1./y + time*5.;
  pos.x = uv.x/y;
  vec3 col = Check(pos/1.5);
  gl_FragColor = vec4(col, 10.)*y;
}