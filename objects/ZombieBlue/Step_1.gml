//Move towards Doc
if (instance_exists(Doc))
{
	if((Doc.x - x) > 0){
		hsp = walksp
	} else {
		hsp = -walksp
	}
}


if ( place_meeting(x,y+1,RandomWall) && !place_meeting(x + (hsp * 1),y+1,RandomWall) ){
	hsp = 0;
}