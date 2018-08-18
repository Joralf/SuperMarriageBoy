/// @description Insert description here
// You can write your code in this editor

key_action = gamepad_button_check_pressed(0, gp_face1);

if key_action
{
	room_goto(r_menu);
}