draw_sprite_tiled(spr_tile, 0, 0, 0);

shader_set(shd_blur);
//var uniform_time = shader_get_uniform(shd_test, "time");
//shader_set_uniform_f(uniform_time, current_time / 1000);

//var uniform_brightness = shader_get_uniform(shd_test, "brightness");
//shader_set_uniform_f(uniform_brightness, current_time / 1000);

var texture_size = shader_get_uniform(shd_blur, "texture_size");

shader_set_uniform_f(texture_size, sprite_get_width(spr_wheel_defender_shoot_flying), sprite_get_height(spr_wheel_defender_shoot_flying));
draw_sprite(spr_wheel_defender_shoot_flying, 0, 100, room_height / 2);
shader_set_uniform_f(texture_size, sprite_get_width(spr_annihilator), sprite_get_height(spr_annihilator));
draw_sprite(spr_annihilator, 0, room_width / 2, room_height / 2);
shader_set_uniform_f(texture_size, sprite_get_width(Spr_explosion), sprite_get_height(Spr_explosion));
draw_sprite(Spr_explosion, 3, room_width - 100, room_height / 2);

shader_reset();