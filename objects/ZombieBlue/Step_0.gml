vsp = vsp + grv;

// Horizontal collision
if ( place_meeting(x+hsp,y,RandomWall) )
{
	while ( !place_meeting(x+sign(hsp),y,RandomWall) )
	{
		x = x + sign(hsp);
	};
	hsp = -hsp;
};

x = x + hsp;


// Vertical collision
if ( place_meeting(x,y+vsp,RandomWall) )
{
	while ( !place_meeting(x,y+sign(vsp),RandomWall) )
	{
		y = y + sign(vsp);
	};
	vsp = 0;
} else {
	y = y + vsp;
	//vsp = 1;
};


// Animations

if ( !place_meeting(x,y+1,RandomWall) )
{
	sprite_index = ZombieBlueWalk;
}
else 
{
	image_speed = 1;
	if ( hsp == 0 )
	{
		sprite_index = ZombieBlueStand;
		image_index = 0;
		image_speed = 0.01;
	}
	else
	{
		sprite_index = ZombieBlueRun;
		
	};
};

if ( hsp != 0) image_xscale = sign(hsp);
