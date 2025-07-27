draw_set_halign(fa_center);
draw_set_font(fnt_font);
draw_set_color(c_white);

var ofs = 2;
draw_text(room_width / 2 + ofs, 10 + ofs, "Left/Right to change shader");
draw_text(room_width / 2 + ofs, 50 + ofs, "Shader: " + obj_parent_shader.name);
draw_text(room_width / 2 + ofs, 10 - ofs, "Left/Right to change shader");
draw_text(room_width / 2 + ofs, 50 - ofs, "Shader: " + obj_parent_shader.name);
draw_text(room_width / 2 - ofs, 10 + ofs, "Left/Right to change shader");
draw_text(room_width / 2 - ofs, 50 + ofs, "Shader: " + obj_parent_shader.name);
draw_text(room_width / 2 - ofs, 10 - ofs, "Left/Right to change shader");
draw_text(room_width / 2 - ofs, 50 - ofs, "Shader: " + obj_parent_shader.name);

draw_set_font(fnt_small);
draw_set_halign(fa_left);
draw_text(10 + ofs, 10 + ofs, $"FPS: {fps}");
draw_text(10 + ofs, 10 - ofs, $"FPS: {fps}");
draw_text(10 - ofs, 10 + ofs, $"FPS: {fps}");
draw_text(10 - ofs, 10 - ofs, $"FPS: {fps}");

draw_set_halign(fa_center);
draw_set_color(c_black);
draw_set_font(fnt_font);

draw_text(room_width / 2, 10, "Left/Right to change shader");
draw_text(room_width / 2, 50, "Shader: " + obj_parent_shader.name);

draw_set_font(fnt_small);
draw_set_halign(fa_left);
draw_text(10, 10, $"FPS: {fps}");