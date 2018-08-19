/// @description Insert description here
// You can write your code in this editor

highscores = ds_map_secure_load("highscores.map");

// Sort lowest to highest

var _next = ds_map_find_first( highscores );
var _count = 0;

size = ds_map_size(highscores);


sorted_highscores = ds_grid_create(2, size);

while ( !is_undefined( _next ) ) {
	ds_grid_add(sorted_highscores, 0, _count, _next);
	ds_grid_add(sorted_highscores, 1, _count, highscores[? _next ]);
 
  _next = ds_map_find_next( highscores, _next );
  _count++;
}


ds_grid_sort(sorted_highscores, 1, true);
