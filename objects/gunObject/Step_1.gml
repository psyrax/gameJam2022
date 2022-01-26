/// @description Gun code

x = Doc.x;
y = Doc.y + 5;

image_angle = point_direction(x, y, mouse_x, mouse_y);

firingdelay = firingdelay - 1;
recoil = max( 0, recoil - 1);

blueTrigger =  mouse_check_button( mb_left);
redTrigger =  mouse_check_button( mb_right);

if blueTrigger or redTrigger and ( firingdelay < 0 )
{
	var currentBullet = BlueBulletObject;
	if redTrigger 
	{ 
		sprite_index = RedGunSprite;
		currentBullet = RedBulletObject;
	} else {
		sprite_index = gunSprite;
	}
	recoil = 4;
	firingdelay = 5;
	with ( instance_create_layer( x, y, "Bullets", currentBullet ) )
	{
		speed = 25;
		direction = other.image_angle + random_range(-3 ,3);
		image_angle = direction;
	}
}

x = x - lengthdir_x( recoil, image_angle );
y = y - lengthdir_y( recoil, image_angle );

if ( image_angle > 90 ) and ( image_angle < 270 )
{
	image_yscale = -1;
}
else
{
	image_yscale = 1;
}