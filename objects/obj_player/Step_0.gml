// Player Input
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check(vk_space);


// Player Movement
var move = key_right - key_left;
hsp = move * walksp;









// Calculate Result

x = x + hsp;