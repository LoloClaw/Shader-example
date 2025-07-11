if (keyboard_check_pressed(vk_left))
{
	instance_destroy(objects[index]);
	index++;
	if (index >= array_length(objects)) index = 0;
	instance_create_layer(room_width / 2, room_height / 2, layer, objects[index]);
}

if (keyboard_check_pressed(vk_right))
{
	instance_destroy(objects[index]);
	index--;
	if (index < 0) index = array_length(objects) - 1;
	instance_create_layer(room_width / 2, room_height / 2, layer, objects[index]);
}