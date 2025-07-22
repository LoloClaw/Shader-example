//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float time;

void main()
{
	vec2 pos = vec2(0.5 - v_vTexcoord.x, 0.5 - v_vTexcoord.y);
	float dist = sqrt(pos.x * pos.x + pos.y * pos.y);
	float offset = sin(dist * 50.0 - time * 5.0);
	vec4 final_color = texture2D(gm_BaseTexture, v_vTexcoord + offset / 300.0);
	final_color.rgb = final_color.rgb - ((offset + 1.0) / 20.0);
	final_color.b *= 1.5;
    gl_FragColor = v_vColour * final_color;
}