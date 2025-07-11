varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D dis_map;
uniform float time;

void main()
{
	vec4 dis_color = texture2D(dis_map, v_vTexcoord);
	float brightness = (dis_color.r + dis_color.b + dis_color.g) / 3.0;
	
    vec4 current_color = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
	
	current_color.r = max(current_color.r, 5.0 - brightness * 50.0 + time * 10.0);
	if (current_color.a != 0.0) current_color.a = 1.0 + brightness * 50.0 - time * 10.0;
	
	gl_FragColor = current_color;
}
