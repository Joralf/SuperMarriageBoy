/// @description Insert description here

var _next = ds_map_find_first( highscores );
var _count = 0;

while ( !is_undefined( _next ) ) {
  var _string = string( _next ) + ": " + string( highscores[? _next ] );
  draw_text( 150, 50 + _count * 70, _string );
 
  _next = ds_map_find_next( highscores, _next );
  _count++;
}