/// @description Insert description here

draw_set_color(c_white);
_next = ds_map_find_first( highscores );
_count = 0;

while ( !is_undefined( _next ) ) {
	seconds = highscores[? _next ]
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
	
  _string = string( _next ) + ": " +  string(d_min) + ":" + string(d_sec) + ":" + string(d_ms);
  draw_text((view_xport[0]+ view_wport[0])/2, 200 + _count * 30, _string );
 
  _next = ds_map_find_next( highscores, _next );
  _count++;
}