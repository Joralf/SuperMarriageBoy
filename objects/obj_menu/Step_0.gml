/// @description Control Menu

// Item Ease In
menu_x += (menu_x_target - menu_x ) / menu_speed;

// Keyboard Controls

if menu_control
{
	if (keyboard_check_pressed(vk_up))
	{
		menu_cursor++;
		if (menu_cursor >= menu_items) menu_cursor = 0;
	}
	
	if (keyboard_check_pressed(vk_down))
	{
		menu_cursor--;
		if (menu_cursor < 0) menu_cursor = menu_items -1;
	}
	
	if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space))
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
		case 1: room_restart(); break;
		case 0: game_restart(); break;
	}
}