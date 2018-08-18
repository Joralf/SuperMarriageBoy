/// @description Insert description here
// You can write your code in this editor


var i_d = ds_map_find_value(async_load, "id");
if i_d == message
   {
   if ds_map_find_value(async_load, "status")
      {
      if ds_map_find_value(async_load, "result") != ""
         {
			name = ds_map_find_value(async_load, "result");
         }
      }
   }

name = string_lower(name);

highscores = ds_map_secure_load("highscores.map");


if ds_map_exists(highscores, name)
{
	previous_highscore = ds_map_find_value(highscores, name);
	if global.seconds < previous_highscore 
	{
		ds_map_replace(highscores, name, global.seconds);
	}

} else 
{
	ds_map_add(highscores, name, global.seconds);
}
ds_map_secure_save(highscores, "highscores.map");

room_goto(r_highscore);