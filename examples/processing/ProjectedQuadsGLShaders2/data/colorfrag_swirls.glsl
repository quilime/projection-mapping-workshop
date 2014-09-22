// Shader by Nicolas Robert [NRX]
// Latest version: http://glsl.heroku.com/e#14662
// Ancestor of http://glsl.heroku.com/e#16679

#ifdef GL_ES
precision mediump float;
#endif

uniform float time;
uniform vec2 resolution;

void main () {
  vec2 position = 4.0 * gl_FragCoord.xy / resolution.xy - 2.0;
  position.x *= resolution.x / resolution.y;
  float d2D = (2.0 + sin (time)) / length (position) + time;
  float a2D = atan (position.y, position.x) + sin (time * 0.2) * 3.14159;
  gl_FragColor = vec4 (0.5 + sin (d2D * 4.0) * sin (a2D * 4.0) * 0.5, 0.5 + sin (a2D * 8.0) * 0.5, 0.5 + sin (d2D * 8.0) * 0.5, 1.0);
}