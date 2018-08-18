/// @description Draw timer

if global.run_timer == 1
{
	draw_text (100, 50, string(d_min) + ":" + string(d_sec) + ":" + string(d_ms))
}