draw_sprite_tiled(spr_tile, 0, 0, 0);

shader_set(sh_outline);

var size = shader_get_uniform(sh_outline, "size");
shader_set_uniform_f(size, 256, 256);

draw_sprite(spr_lines, 0, x + 150, y);
draw_sprite(spr_lines, 1, x - 150, y);

shader_reset();