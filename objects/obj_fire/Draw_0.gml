gpu_set_tex_filter(true);
gpu_set_tex_repeat(true);

draw_sprite_tiled(spr_tile, 0, x, y);

if (!surface_exists(surf)) surf = surface_create(room_width, room_height);
surface_set_target(surf);
draw_clear_alpha(c_black, 0);
surface_reset_target();
shader_set(sh_fire);

var dis_map = shader_get_sampler_index(sh_fire, "dis_map");
texture_set_stage(dis_map, sprite_get_texture(spr_noise, 0));

var grad_map = shader_get_sampler_index(sh_fire, "grad_map");
texture_set_stage(grad_map, sprite_get_texture(spr_gradient, 0));

var time = shader_get_uniform(sh_fire, "time");
shader_set_uniform_f(time, current_time / 1000);
draw_surface(surf, 0, 0);
shader_reset();
