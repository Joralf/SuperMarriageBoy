/// @description Insert description here
// You can write your code in this editor

key_action = gamepad_button_check_pressed(0, gp_face1);

if key_action {
	room_goto(r_menu)
}

// Reset scores

left = keyboard_check_pressed(vk_left);
right =  keyboard_check_pressed(vk_right);
tab = keyboard_check_pressed(vk_tab);

if left
{
	
	highscores = ds_map_create();
	ds_map_secure_save(highscores, "highscores.map");
}