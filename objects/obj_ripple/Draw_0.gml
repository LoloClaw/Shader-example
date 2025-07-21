gpu_set_tex_filter(true);
gpu_set_tex_repeat(true);

if (!surface_exists(surf)) surf = surface_create(room_width, room_width);
surface_set_target(surf);
draw_clear_alpha(c_black, 0);

draw_sprite_tiled(spr_tile, 0, room_width / 2 , room_height / 2);
draw_sprite(spr_wheel_defender_shoot_flying, 0, room_width / 4, room_height / 2);
draw_sprite(spr_annihilator, 0, room_width / 4 * 3, room_height / 2);

surface_reset_target();

shader_set(sh_ripple);

var time = shader_get_uniform(sh_ripple, "time");
shader_set_uniform_f(time, current_time / 1000);

draw_surface(surf, 0, - room_height / 5);

shader_reset();