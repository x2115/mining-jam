get_input();
if(!game_started){
	global.end_time=current_time+game_length+1000;	
}
if(minecdtimer>0){
	minecdtimer--;	
}
if(state!=states.mine){
	
	var fdir=right-left;
	if(fdir!=0){
		facing=fdir;	
	}
	if(up){
		aimdir=dirs.up;	
	}else if(down){
		aimdir=dirs.down;
	}else{
		aimdir=dirs.forwards;
	}
	if(minecdtimer<=0){
		xspd+=accel*fdir;
	}else{
		xspd=0;	
	}
	xspd=move_towards_zero(xspd,fric);
	xspd=clamp(xspd,-mspd,mspd);
	var solidground=instance_position(x,y+1,o_block_parent);
	if(place_free(x,y+1)){
		yspd+=grav;	
		coyotetimer--;
		state=states.jump;
	}else{
		if(xspd==0){
			if(solidground){
				state=states.idle;
			}else{
				state=states.wobbling;	
			}
		}else{
			state=states.walk;	
		}
		if(mine&&solidground&&minecdtimer<=0){
			if(can_mine()){
				game_started=true;
				state=states.mine;	
				image_index=0;
			}
		}
		yspd=0;
		coyotetimer=coyotetime;
	}
	if(jump&&coyotetimer>0&&place_free(x,y-8)){
		coyotetimer=0;
		yspd=-jspd;	
	}

	yspd=min(yspd,8);
	while(!place_free(x+xspd,y)){
		xspd=move_towards_zero(xspd,0.05);
	}
	x+=xspd;

	while(!place_free(x,y+yspd)){
		yspd=move_towards_zero(yspd,0.05);
	
	}
	y+=yspd;
	x=clamp(x,4,room_width-4);
	y=max(y,global.cam_y);
}
switch(state){
	case states.mine:
		switch(aimdir){
			case dirs.up: sprite_index=s_char_mine_u; break;
			case dirs.forwards: sprite_index=s_char_mine_f; break;
			case dirs.down: sprite_index=s_char_mine_d; break;
		}
		break;
	case states.idle:
		switch(aimdir){
			case dirs.up: sprite_index=s_char_idle_u; break;
			case dirs.forwards: sprite_index=s_char_idle_f; break;
			case dirs.down: sprite_index=s_char_idle_d; break;
		}
		break;
	case states.wobbling:
		sprite_index=s_char_wobbling;
		break;
	case states.walk:
		sprite_index=s_char_walk;
		break;
	case states.jump:
		sprite_index=s_char_jump;
		break;
}
