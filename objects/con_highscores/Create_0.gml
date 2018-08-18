/// @description Insert description here
// You can write your code in this editor

highscores = ds_map_secure_load("highscores.map");

// Sort lowest to highest

var _next = ds_map_find_first( highscores );
var _count = 0;

size = ds_map_size(highscores);


temp_grid = ds_grid_create(2, size);

while ( !is_undefined( _next ) ) {
	ds_grid_add(temp_grid, 0, _count, _next);
	ds_grid_add(temp_grid, 1, _count, highscores[? _next ]);
 
  _next = ds_map_find_next( highscores, _next );
  _count++;
}


ds_grid_sort(temp_grid, 1, true);

highscores = ds_map_create();



var i;
for (i = 0; i < size; i += 1)
{
	name = ds_grid_get(temp_grid, 0, i);
	seconds = ds_grid_get(temp_grid, 1, i);
	ds_map_add(highscores, name, seconds);
}

ds_map_secure_save(highscores, "highscores.map");