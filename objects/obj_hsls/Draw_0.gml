draw_sprite_tiled(spr_tile, 0, 0, 0);

shader_set(sh_hsls_test);

draw_sprite(spr_wheel_defender_shoot_flying, 0, x, y);
draw_sprite(spr_lines, 0, x - 200, y);
draw_sprite(spr_water, 0, x + 200, y);
shader_reset();