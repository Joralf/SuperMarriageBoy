/// @description Increase timer
global.seconds += (delta_time / 1000000) * room_speed
d_min = global.seconds div 3600;
d_sec = (global.seconds div 60) - (d_min * 60);

if d_sec < 10
{
	d_sec = "0" + string(d_sec);
}

d_ms = round((global.seconds mod 60) * 100 / 60);
if d_ms < 10
{
	d_ms = "0" + string(d_ms);
}
