/// @description Insert description here

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
  draw_text( 150, 50 + _count * 70, _string );
 
  _next = ds_map_find_next( highscores, _next );
  _count++;
}