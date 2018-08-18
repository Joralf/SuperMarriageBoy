/// @description Create Menu

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
gui_margin = 200;
menu_x = gui_width + gui_margin * 2;
menu_y = gui_height - gui_margin;
menu_x_target = gui_width - gui_margin;
menu_speed = 10;
menu_font = fMenu;
menu_itemheight = font_get_size(fMenu);
menu_committed = -1;
menu_control = true;

menu[2] = "Start";
menu[1] = "Highscores";
menu[0] = "Quit";

menu_items = array_length_1d(menu);
menu_cursor = 2;

audio_play_sound(sound_smb_intro, 10, false);





// Highscores

highscores = ds_map_create();

ds_map_add(highscores, "Joralf", 500);
ds_map_add(highscores, "Sanne", 300);
ds_map_add(highscores, "Marijke", 900);
ds_map_add(highscores, "Jelmar", 250);


ds_map_secure_save(highscores, "highscores.map");