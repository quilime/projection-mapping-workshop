#ifdef GL_ES
precision mediump float;
#endif

uniform float time;
uniform vec2 mouse;
uniform vec2 resolution;

void main(void){
  vec2 v = (gl_FragCoord.xy - resolution/2.0) / min(resolution.y,resolution.x) * 20.0;
  vec2 vv = v; vec2 vvv = v;
  float tm = time*0.005;
  vec2 mspt = vec2(sin(tm),cos(tm));
  float R = 0.0;
  float RR = 0.0;
  float RRR = 0.0;
  float a = (.6-mspt.x)*6.2;
  float C = cos(a);
  float S = sin(a);
  vec2 xa=vec2(C, -S);
  vec2 ya=vec2(S, C);
  vec2 shift = vec2( 0, 1.62);
  float Z = 1.0 + mspt.y*6.0;
  float ZZ = 1.0 + (mspt.y)*6.2;
  float ZZZ = 1.0 + (mspt.y)*6.9;
  
  for ( int i = 0; i < 40; i++ ){
    float r = dot(v,v);
    if ( r > 1.0 )
    {
      r = (1.0)/r ;
      v.x = v.x * r;
      v.y = v.y * r;
    }
    R *= .99;
    R += r;
    if(i < 39){
      RR *= .99;
      RR += r;
      if(i < 38){
        RRR *= .99;
        RRR += r;
      }
    }
    
    v = vec2( dot(v, xa), dot(v, ya)) * Z + shift;
  }
  float c = ((mod(R,2.0)>1.0)?1.0-fract(R):fract(R));
  float cc = ((mod(RR,2.0)>1.0)?1.0-fract(RR):fract(RR));
  float ccc = ((mod(RRR,2.0)>1.0)?1.0-fract(RRR):fract(RRR));
  gl_FragColor = vec4(ccc, cc, c, 1.0); 
}