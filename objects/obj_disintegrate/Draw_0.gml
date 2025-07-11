time++;
draw_sprite_tiled(spr_tile, 0, x, y);

gpu_set_tex_filter(true);
gpu_set_tex_repeat(true);

shader_set(sh_dissipate);

var dis_map = shader_get_sampler_index(sh_water, "dis_map");
texture_set_stage(dis_map, sprite_get_texture(spr_noise, 0));
var _time = shader_get_uniform(sh_water, "time");
shader_set_uniform_f(_time, time / 60);

draw_sprite(spr_wheel_defender_shoot_flying, 3, room_width / 2, room_height / 2)
draw_set_color(c_black);
draw_set_halign(fa_center);
draw_set_font(fnt_font);
draw_text(room_width / 2, room_height - 100, "THIS IS A TANK");
draw_set_color(c_white);
shader_reset();