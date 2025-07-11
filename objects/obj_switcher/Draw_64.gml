draw_set_halign(fa_center);
draw_set_color(c_black);
draw_set_font(fnt_font);
draw_text(room_width / 2, 10, "Left/Right to change shader");

draw_text(room_width / 2, 50, "Shader: " + obj_parent_shader.name);