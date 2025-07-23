if (!surface_exists(surf)) surf = surface_create(room_width, room_height);

surface_set_target(surf);
draw_clear_alpha(c_black, 0);

draw_sprite_tiled(spr_tile, 0, 0, 0);
draw_sprite(spr_wheel_defender_shoot_flying, 0, 100, room_height / 2);
draw_sprite(spr_annihilator, 0, room_width / 2, room_height / 2);
draw_sprite(Spr_explosion, 3, room_width - 100, room_height / 2);
draw_set_font(fnt_font);
draw_set_halign(fa_center);
draw_text(room_width / 2, room_height - 200, "THIS IS BLURRY!!");

surface_reset_target();

shader_set(shd_blur);

var texture_size = shader_get_uniform(shd_blur, "texture_size");
shader_set_uniform_f(texture_size, room_width, room_height);

draw_surface(surf, 0, 0);

shader_reset();