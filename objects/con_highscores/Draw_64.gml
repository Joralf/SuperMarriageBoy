/// @description Draw highscores

draw_set_halign(fa_left);
draw_set_valign(fa_top);

for (var row = 0; row < ds_grid_height(sorted_highscores); row++)
{
	// Fetch row from sorted_highscores
	name = ds_grid_get(sorted_highscores, 0, row);
	seconds = ds_grid_get(sorted_highscores, 1, row);
	
	// Convert seconds to minutes and miliseconds
	d_min = seconds div 3600;
	d_sec = (seconds div 60) - (d_min * 60);

	if d_sec < 10
	{
		d_sec = "0" + string(d_sec);
	}

	d_ms = round((seconds mod 60) * 100 / 60);
	if d_ms < 10
	{
		d_ms = "0" + string(d_ms);
	}
	
	if string_length(name) > 10
	{
		name = string_copy(name, 1, 14) + "...";
	}
	
	if name == global.current_user_name
	{
		draw_set_color(c_red);
	} else {
		draw_set_color(c_black);
	}
	// Draw highscore row
	if (row < 20)
	{
		y_pos = 300 + row * 22;
		draw_text(60, y_pos, string(row + 1))
		draw_text(90, y_pos, string(name));
		draw_text(260, y_pos, string(d_min) + ":" + string(d_sec) + ":" + string(d_ms));
	} else if (row < 40) {
		y_pos = 300 + (row - 20) * 22;
		draw_text(360, y_pos, string(row + 1))
		draw_text(390, y_pos, string(name));
		draw_text(560, y_pos, string(d_min) + ":" + string(d_sec) + ":" + string(d_ms));
	} else if (row < 60) {
		y_pos = 300 + (row - 40) * 22;
		draw_text(660, y_pos, string(row + 1))
		draw_text(690, y_pos, string(name));
		draw_text(860, y_pos, string(d_min) + ":" + string(d_sec) + ":" + string(d_ms));
	} else {
		// don't draw
	}
}


