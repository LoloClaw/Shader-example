//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 size;
uniform sampler2D map;
uniform float str;

vec3 posterize(vec3 color, float strength)
{
	return ceil(color * strength) / strength;
}

vec3 overlay(vec3 color, vec3 over_map)
{
	return color * over_map;
}

vec4 outline(vec4 color, float pos_str, float out_str)
{
	mat3 sobely = mat3(
	1.0, 2.0, 1.0, 
	0.0, 0.0, 0.0, 
	-1.0, -2.0, -1.0);
	
	mat3 sobelx = mat3(
	1.0, 0.0, -1.0, 
	2.0, 0.0, -2.0, 
	1.0, 0.0, -1.0);
	
	mat3 magnitudes;
	
	for (int i = 0; i < 3; i++)
	{
		for (int j = 0; j < 3; j++)
		{
			vec2 coords = vec2(v_vTexcoord.x + (float(i) - 1.0) / size.x, v_vTexcoord.y + (float(j) - 1.0) / size.y);
			magnitudes[i][j] = length(posterize(texture2D(gm_BaseTexture, coords).rgb, pos_str)) / out_str;
		}
	}
	
	float x = dot(sobelx[0], magnitudes[0]) + dot(sobelx[1], magnitudes[1]) + dot(sobelx[2], magnitudes[2]);
	float y = dot(sobely[0], magnitudes[0]) + dot(sobely[1], magnitudes[1]) + dot(sobely[2], magnitudes[2]);
	
	float line = sqrt(x * x + y * y);
	
	//if (length(line) == 0.0) alpha = 0.0;
	return vec4(line * color.r, line * color.g, line * color.b, color.a);
}

void main()
{
	vec4 base = texture2D( gm_BaseTexture, v_vTexcoord );
	vec4 map_color = texture2D( map, v_vTexcoord * 10.0) * 1.5;
	
	base.rgb = posterize(base.rgb, str);
	
	vec4 lines = outline(base, str, 2.0);
	if ((lines.r > 0.5) && (lines.g > 0.5) && (lines.b > 0.5)) lines.rgb = vec3(0.0);
	else lines.rgb = vec3(1.0);
	if (lines.r == 0.0) base = lines;
	
	if ((base.r == base.b) && (base.b == base.g)) base.gb *= 1.1;
	
	base.rgb = overlay(base.rgb, map_color.rgb);
	
    gl_FragColor = v_vColour * base;
}
