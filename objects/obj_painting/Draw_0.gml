gpu_set_tex_repeat(true);
if (keyboard_check_pressed(vk_up)) time++;
if (keyboard_check_pressed(vk_down)) time--;

shader_set(sh_painting);
var map = shader_get_sampler_index(sh_painting, "map");
texture_set_stage(map, sprite_get_texture(spr_paint, 0));

var str = shader_get_uniform(sh_painting, "str");
shader_set_uniform_f(str, time);

draw_sprite(spr_forest, 0, room_width / 2, room_height / 2);
shader_reset();
