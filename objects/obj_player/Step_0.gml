// Global variables
var bbox_side; // to indicate which side is going to collide


// Player Input
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check(vk_space);
key_sprint = keyboard_check(vk_shift);


// Horizontal Player Movement
var move = key_right - key_left;
if key_sprint hsp = move * sprntsp; else hsp = move * walksp;


// Vertical Player Movement
if key_jump
{
	if grounded // Regular Jump
	{
		vsp = jumpsp;
		grounded = false;
	}
	else if !grounded && (tilemap_get_at_pixel(tilemap, bbox_left - 1, bbox_top) != 0) && !walljump_left // Left Wall Jump
	{
		vsp = walljump_sp;
		walljump_right = false;
		walljump_left = true;
	}
	else if !grounded && (tilemap_get_at_pixel(tilemap, bbox_right + 1, bbox_bottom) != 0) && !walljump_right // Right Wall Jump
	{
		vsp = walljump_sp;
		walljump_right = true;
		walljump_left = false;
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
	}
	else  // collision left
	{
		x = x - (x % 64) - (bbox_left - x);
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
	}
	else 
	{
		y = y - (y % 64) - (bbox_top - y);
		grounded = false;
	}
	vsp = 0;
}


// Calculate New Position
x += hsp;
y += vsp;