//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D map;
uniform float str;

void main()
{
	vec4 base = texture2D( gm_BaseTexture, v_vTexcoord );
	vec4 map_color = texture2D( map, v_vTexcoord * 10.0) * 1.5;
	
	base.rgb = ceil(base.rgb * str) / str;
	base.rgb *= map_color.rgb;
	
    gl_FragColor = v_vColour * base;
}
