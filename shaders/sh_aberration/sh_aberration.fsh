//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	vec2 off_red = vec2(0.011, -0.009);
	vec2 off_green = vec2(0.003, 0.006);
	vec2 off_blue = vec2(-0.006, 0.002);
	
	vec4 color;
	
	color.r = texture2D(gm_BaseTexture, v_vTexcoord + off_red).r;
	color.g = texture2D(gm_BaseTexture, v_vTexcoord + off_green).g;
	color.b = texture2D(gm_BaseTexture, v_vTexcoord + off_blue).b;
	color.a = texture2D(gm_BaseTexture, v_vTexcoord).a;
	
	
    gl_FragColor = v_vColour * color;
}
