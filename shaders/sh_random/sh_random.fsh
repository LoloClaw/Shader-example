//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float time;

float random(vec2 value)
{
	return fract(sin(value.x * 129.898 + value.y * 78.233) * 43758.5453);
}

void main()
{
    gl_FragColor.g = random(gl_FragCoord.xy + vec2(time));
	gl_FragColor.rb = vec2(0.0);
	gl_FragColor.a = 1.0;
}
