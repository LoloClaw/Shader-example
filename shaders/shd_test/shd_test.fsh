//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float time;
uniform float brightness;

void main()
{
	vec2 pos = v_vTexcoord;
    vec4 current_color = v_vColour * texture2D( gm_BaseTexture, pos );
	
	current_color.rgb *= brightness;
	
	gl_FragColor = current_color;
}
