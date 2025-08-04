gpu_set_tex_repeat(true);
if (keyboard_check_pressed(vk_up)) time++;
if (keyboard_check_pressed(vk_down)) time--;

if (!surface_exists(surf)) surf = surface_create(room_width, room_height)
surface_set_target(surf);
draw_clear_alpha(c_black, 0);
draw_sprite(spr_forest, 0, room_width / 2, room_height / 2);
surface_reset_target()

shader_set(sh_painting);
var map = shader_get_sampler_index(sh_painting, "map");
texture_set_stage(map, sprite_get_texture(spr_paint, 0));

var str = shader_get_uniform(sh_painting, "str");
shader_set_uniform_f(str, time);

var size = shader_get_uniform(sh_painting, "size");
shader_set_uniform_f(size, room_width, room_height);

draw_surface(surf, 0, 0);
shader_reset();
