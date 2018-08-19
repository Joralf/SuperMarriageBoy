/// @description Draw timer

var _vx = camera_get_view_width(view_camera[0]);
var _vy = camera_get_view_height(view_camera[0]);
display_set_gui_size(_vx, _vy);


draw_set_font(fTimer);
draw_set_colour(c_red);
if global.run_timer == 1
{
	timer = string(d_min) + ":" + string(d_sec) + ":" + string(d_ms);
	draw_text_transformed(125, 75, timer, 1, 1, 0);
}