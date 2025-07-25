if (!surface_exists(surf)) surf = surface_create(room_width, room_height);

surface_set_target(surf);
draw_clear_alpha(c_black, 0);
draw_sprite_tiled(spr_tile, 0, 0, 0);

draw_sprite(spr_wheel_defender_shoot_flying, 0, 100, room_height / 2);
draw_sprite(spr_annihilator, 0, room_width / 2, room_height / 2);
draw_sprite(Spr_explosion, 3, room_width - 100, room_height / 2);

surface_reset_target();

shader_set(sh_aberration);
draw_surface(surf, 0, 0);
shader_reset();