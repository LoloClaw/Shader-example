draw_sprite_tiled(spr_tile, 0, 0, 0);

if (!surface_exists(surf)) surf = surface_create(room_width, room_height);
surface_set_target(surf);
draw_clear_alpha(c_black, 0);
draw_sprite(spr_lines, 0, x + 150, y);
draw_sprite(spr_lines, 1, x - 150, y);
surface_reset_target();

shader_set(sh_outline);

draw_surface(surf, 0, 0);

var size = shader_get_uniform(sh_outline, "size");
shader_set_uniform_f(size, room_width, room_height);

shader_reset();