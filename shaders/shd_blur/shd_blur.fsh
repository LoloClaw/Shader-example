//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 texture_size;
vec2 texel = 1.0 / texture_size;


void main()
{
	vec4 surrounding_color = (
	(texture2D( gm_BaseTexture, vec2(v_vTexcoord.x - texel.x, v_vTexcoord.y))) +
	(texture2D( gm_BaseTexture, vec2(v_vTexcoord.x + texel.x, v_vTexcoord.y))) +
	(texture2D( gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y - texel.y))) +
	(texture2D( gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y + texel.y)))) / 4.0;
	
	vec4 diagonal_color = (
	(texture2D( gm_BaseTexture, vec2(v_vTexcoord.x - texel.x, v_vTexcoord.y - texel.y))) +
	(texture2D( gm_BaseTexture, vec2(v_vTexcoord.x + texel.x, v_vTexcoord.y + texel.y))) +
	(texture2D( gm_BaseTexture, vec2(v_vTexcoord.x - texel.x, v_vTexcoord.y - texel.y))) +
	(texture2D( gm_BaseTexture, vec2(v_vTexcoord.x + texel.x, v_vTexcoord.y + texel.y)))) / 4.0;
	
	vec4 original_color = texture2D(gm_BaseTexture, v_vTexcoord);
	vec4 final_color = (surrounding_color + original_color + diagonal_color) / 3.0;
	
	//final_color.a = (texture2D(gm_BaseTexture, v_vTexcoord)).a;
    gl_FragColor = v_vColour * final_color;
}
