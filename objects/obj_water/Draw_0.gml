gpu_set_tex_filter(true);
gpu_set_tex_repeat(true);

shader_set(sh_water);

var dis_map = shader_get_sampler_index(sh_water, "dis_map");
texture_set_stage(dis_map, sprite_get_texture(spr_noise, 0));

var time = shader_get_uniform(sh_water, "time");
shader_set_uniform_f(time, current_time / 1000);

draw_sprite_tiled(spr_water, 0, x, y);
shader_reset();