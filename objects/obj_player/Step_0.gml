var bbox_side; // to indicate which side is going to collide


// Player Input
if (abs(gamepad_axis_value(0, gp_axislh)) > 0.2)
{
	key_left = abs(min(gamepad_axis_value(0, gp_axislh), 0));
	key_right = max(gamepad_axis_value(0, gp_axislh), 0);
} else
{
	key_left = 0;
	key_right = 0;
}

key_sprint = gamepad_button_check(0, gp_shoulderrb);
key_jump = gamepad_button_check_pressed(0, gp_face1);
key_quit = gamepad_button_check_pressed(0, gp_start);

// Check Win condition
if (place_meeting(x, y, obj_bandage_girl)) {
	if room_next(room) != -1
	{
		room_goto_next();
	} 
	else
	{	
		global.run_timer = 0;
		room_goto(r_set_highscore);
	}
} 

// Check Lose Condition
if (place_meeting(x, y, obj_circle_saw)) || (place_meeting(x, y, obj_circle_saw_vertical)) || (place_meeting(x, y, obj_circle_saw_horizontal)) 
{
	room_restart();
} 

if y > room_height
{
	room_restart();
}

// Check Quit condition
if key_quit
{
	room_goto(r_menu);
}

// Horizontal Player Movement
var move = key_right - key_left;
if key_sprint hsp = move * sprntsp; else hsp = move * walksp;


// Vertical Player Movement
if key_jump
{
	if grounded // Regular Jump
	{
		vsp = -jumpsp;
		grounded = false;
		audio_play_sound(sound_meat_jumping, 10, false);
	}
	else if !grounded && (tilemap_get_at_pixel(tilemap, bbox_left - 1, bbox_bottom) != 0) && (x > last_wall_jump_x + 10 || x < last_wall_jump_x - 10) // Left Wall Jump
	{
		vsp = -walljump_sp;
		last_wall_jump_x = x;
		grounded = false;
		audio_play_sound(sound_meat_wall_jump, 10, false);
	}
	else if !grounded && (tilemap_get_at_pixel(tilemap, bbox_right + 1, bbox_bottom) != 0) && (x > last_wall_jump_x + 10 || x < last_wall_jump_x - 10) // Right Wall Jump
	{
		vsp = -walljump_sp;
		last_wall_jump_x = x;
		grounded = false;
		audio_play_sound(sound_meat_wall_jump, 10, false);
	}
}



// Gravity
vsp = vsp + grv


// Horizontal collision with "Collision" layer
if (hsp > 0) bbox_side = bbox_right; else bbox_side = bbox_left;

if (tilemap_get_at_pixel(tilemap, bbox_side + hsp, bbox_top) != 0) || (tilemap_get_at_pixel(tilemap, bbox_side + hsp, bbox_bottom) != 0)
{ 
	if (hsp > 0)  // collision right
	{ 
		x = x - (x % 64) + 63 - (bbox_right - x);
		if !grounded y = y - wall_stick_sp
	}
	else  // collision left
	{
		x = x - (x % 64) - (bbox_left - x);
		if !grounded y = y - wall_stick_sp 
	}
	hsp = 0;
}


// Vertical collision with "Collision" layer
if (vsp > 0) bbox_side = bbox_bottom else bbox_side = bbox_top;

if (tilemap_get_at_pixel(tilemap, bbox_left, bbox_side + vsp) != 0) || (tilemap_get_at_pixel(tilemap, bbox_right, bbox_side + vsp) != 0)
{ 
	if (vsp > 0) 
	{
		y = y - (y % 64) + 63 - (bbox_bottom - y);
		grounded = true;
		walljump_left = false;
		walljump_right = false;
		last_wall_jump_x = -999;
		if (play_landing_sound)
		{
			audio_play_sound(sound_meat_landing, 10, false);
			play_landing_sound = false;
		}
	}
	else 
	{
		y = y - (y % 64) - (bbox_top - y);
		grounded = false;
	}
	vsp = 0;
} else {
	play_landing_sound = true;
}


// Calculate New Position
x += hsp;
y += vsp;


// Animations

if (hsp != 0) image_xscale = sign(hsp);