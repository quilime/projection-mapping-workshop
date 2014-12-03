#ifdef GL_ES
precision mediump float;
#endif


uniform float time;
uniform vec2 mouse;
uniform vec2 resolution;

#define pi    3.1415926535897932384626433832795 //pi

void main()
{

vec2 surfacePosition = ((gl_FragCoord.xy / resolution) * 2.) - 1.;

  vec2 p   = surfacePosition * 6.0;
  vec3 col = vec3( 0.0, 0.0, 0.0 );
  float ca = 0.0;
  for( int j = 1; j < 14; j++ )
  {
    p *= 1.4;
    float jj = float( j );
    
    for( int i = 1; i <10; i++ )
    {
      vec2 newp = p*0.96;
      float ii = float( i );
      newp.x += 0.8 / ( ii + jj) * sin( ii * p.y + time + 0.3 * ( jj / ii ) ) + 1.0;
      newp.y += 0.8 / ( ii + jj ) * sin( ii * p.x + time + 0.3 * ( jj / ii ) ) - 1.0;
      p=newp;
      
    
    }
    p   *= 0.9;
    col += vec3( 0.5 * sin( pi * p.x ) + 0.5, 0.5 * sin( pi * p.y ) + 0.5, 0.5 * sin( pi * p.x ) * cos( pi * p.y ) + 0.5 );
    ca  += 0.7;
  }
  col /= ca;
  gl_FragColor = vec4( col * col * col, 1.0 );
}
