varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 size;

void main()
{
	float alpha = (v_vColour * texture2D( gm_BaseTexture, v_vTexcoord )).a;
	vec3 color = (v_vColour * texture2D( gm_BaseTexture, v_vTexcoord )).rgb;
	
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
			magnitudes[i][j] = length(texture2D(gm_BaseTexture, coords).rgb);
		}
	}
	
	float x = dot(sobelx[0], magnitudes[0]) + dot(sobelx[1], magnitudes[1]) + dot(sobelx[2], magnitudes[2]);
	float y = dot(sobely[0], magnitudes[0]) + dot(sobely[1], magnitudes[1]) + dot(sobely[2], magnitudes[2]);
	
	float line = sqrt(x * x + y * y);
	
	//if (length(line) == 0.0) alpha = 0.0;
	vec4 final = vec4(line * color.r, line * color.g, line * color.b, alpha);
	
	gl_FragColor = final;
}
