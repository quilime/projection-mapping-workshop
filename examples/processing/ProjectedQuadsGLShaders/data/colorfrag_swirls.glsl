#ifdef GL_ES
precision mediump float;
#endif

uniform float time;
uniform vec2 mouse;
uniform vec2 resolution;

float fsin(float t)
{
  return sin(t * 6.28);
}


void main( void ) {
  float t = time * 0.1;
  vec2 p = (gl_FragCoord.xy / resolution.xy);

  float color = fsin(fsin(p.x * 1.5) - fsin(p.y - t)) + fsin(p.x * 1.5 + p.y * 2.5 + t);
  gl_FragColor = vec4(color, color * 0.25, -color*0.5, 1.0);
}