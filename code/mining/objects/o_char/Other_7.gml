if(state==states.mine){
	state=states.idle;
	var block=noone;
	switch(aimdir){
		case dirs.forwards: block=instance_position(x+facing*8,y-8,o_block_parent); break;
		case dirs.down: block=instance_position(x,y+3,o_block_parent); break;
		case dirs.up: block=instance_position(x,y-19,o_block_parent); break;
	}
	mine_block(block);
	minecdtimer=minecdtime;
}
