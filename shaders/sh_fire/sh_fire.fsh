varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D grad_map;
uniform sampler2D dis_map;
uniform float time;

vec4 yellow = vec4(1.0, 1.0, 0.0, 1.0);
vec4 red = vec4(1.0, 0.0, 0.0, 1.0);
vec4 orange = vec4(0.97, 0.58, 0.11, 1.0);

vec4 frag(vec2 coord) 
{
	float noiseValue = texture2D(dis_map, coord + vec2(time / 3.0, time / 1.5)).r;
	float gradientValue = texture2D(grad_map, coord).r;

	float step1 = step(noiseValue, gradientValue);
	float step2 = step(noiseValue, gradientValue-0.2);
	float step3 = step(noiseValue, gradientValue-0.4);
	
	vec3 L1 = mix(yellow.rgb, red.rgb, step1 - step2);
	vec4 c = vec4(L1, step1);
	c.rgb = mix(c.rgb, orange.rgb, step2 - step3);
	
	return c;
}

void main()
{	
    gl_FragColor = v_vColour * frag(v_vTexcoord);
}
