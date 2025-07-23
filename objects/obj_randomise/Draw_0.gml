draw_set_color(c_white);
if (!surface_exists(surf)) surf = surface_create(150, 100);

surface_set_target(surf);
shader_set(sh_random);

var u_time = shader_get_uniform(sh_random, "time");
shader_set_uniform_f(u_time, time);

draw_rectangle(0, 0, 150, 100, false);
shader_reset();

surface_reset_target();

draw_surface_ext(surf, 0, 0, room_width / 150, room_height / 100, 0, c_white, 1);