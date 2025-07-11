varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D dis_map;
uniform float time;

void main()
{
	vec2 time_offset = vec2(time / 10.0, time / 50.0);
	vec4 dis_color = texture2D(dis_map, v_vTexcoord + time_offset);
	float brightness = (dis_color.r + dis_color.b + dis_color.g) / 3.0 - 0.5;
	vec2 offset = vec2(brightness / 8.0, 0);
	
    gl_FragColor = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord + offset);
}
