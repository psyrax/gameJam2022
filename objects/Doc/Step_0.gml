/// @description Step event

// Key bind
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_jump = keyboard_check_pressed(vk_space);

// Move calc
var move = key_right - key_left;
hsp = move * walksp;

vsp = vsp + grv;

if ( place_meeting( x, y+1, RandomWall ) ) and ( key_jump ) {
	vsp = -7;
}

// Horizontal collision
if ( place_meeting( x+hsp, y, RandomWall ) )
{
	while ( !place_meeting( x+sign(hsp), y, RandomWall ) )
	{
		x = x + sign( hsp );
	};
	hsp = 0;
};

x = x + hsp; 

// Vertical collision
if ( place_meeting( x ,y+vsp, RandomWall ) )
{
	while ( !place_meeting( x, y+sign( vsp ) , RandomWall ) )
	{
		y = y + sign( vsp );
	};
	vsp = 0;
};

y = y + vsp;


// Animations

if ( !place_meeting( x, y+1, RandomWall ) )
{
	sprite_index = DocJump;
	if ( sign(vsp) > 0  )
	{
		sprite_index = DocLand;
	}
	else
	{
		sprite_index = DocJump;
	};
}
else 
{
	image_speed = 1;
	if ( hsp == 0 )
	{
		sprite_index = DocIdle;
	}
	else
	{
		sprite_index = DocRun;
		
	};
};

if ( hsp != 0) image_xscale = sign( hsp );
