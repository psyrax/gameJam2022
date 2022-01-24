// inputs
up_key = keyboard_check_pressed(vk_up);
down_key = keyboard_check_pressed(vk_down);
accept_key = keyboard_check_pressed(vk_enter);

// move menu
pos += down_key - up_key;
if  pos >= op_length { pos = 0 };
if  pos < 0 { pos = op_length-1 };

//selecting menu
if accept_key {
	switch (pos){
		case 0:
			room_goto(DocTest);
			break;
		case 1:
			room_goto(ZombieRoomTest);
			break;
		case 2:
			game_end();
			break;

	}
}