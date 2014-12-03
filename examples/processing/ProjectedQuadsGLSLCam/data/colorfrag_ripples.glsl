#ifdef GL_ES
precision mediump float;
#endif
#define d .001
uniform float time;
uniform vec2 mouse;
uniform vec2 resolution;

float f(vec2 xy){
  return .1*sin(time+ length(xy) *3.14*8.)/d;
}
vec3 norm(float fdx, float fdy){
  return normalize(vec3(-fdx, -fdy, 1));
}
void main( void ) {
  vec3 m= vec3(mouse*2.-1.,1);
  vec2 pos = ( gl_FragCoord.xy / resolution.xy )*2.-1.;
  pos.x*=2.;
  float h0= f(pos);
  float hdx= h0-f(pos+vec2(d,0));
  float hdy= h0-f(pos+vec2(0,d));
  vec3 n= norm(hdx,hdy);
  gl_FragColor = vec4( .2+ .7*abs(vec3(dot(n, normalize(m)))) , 1.0 );
}