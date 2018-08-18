/// @description Control Menu

// Item Ease In
menu_x += (menu_x_target - menu_x ) / menu_speed;

key_action = gamepad_button_check_pressed(0, gp_face1);
key_up = gamepad_button_check_pressed(0, gp_padu);
key_down = gamepad_button_check_pressed(0, gp_padd);

//  Controls
if menu_control
{
	if (key_up)
	{
		menu_cursor++;
		if (menu_cursor >= menu_items) menu_cursor = 0;
	}
	
	if (key_down)
	{
		menu_cursor--;
		if (menu_cursor < 0) menu_cursor = menu_items -1;
	}
	
	if (key_action)
	{
		menu_x_target = gui_width + gui_margin * 2;
		menu_committed = menu_cursor;
		// ScreenShake(4,30);
		menu_control = false;
	}
}

if (menu_x > gui_width + 300) && (menu_committed != -1)
{
	switch(menu_committed)
	{
		case 2: room_goto(r_level1); break;
		case 1: room_goto(r_highscore); break;
		case 0: game_end(); break;
	}
}