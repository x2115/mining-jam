get_input();

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
	
	xspd+=accel*fdir;
	xspd=move_towards_zero(xspd,fric);
	xspd=clamp(xspd,-mspd,mspd);

	if(place_free(x,y+1)){
		yspd+=grav;	
		coyotetimer--;
		state=states.jump;
	}else{
		if(xspd==0){
			state=states.idle;
		}else{
			state=states.walk;	
		}
		if(mine){
			state=states.mine;	
			image_index=0;
		}
		yspd=0;
		coyotetimer=coyotetime;
	}
	if(jump&&coyotetimer>0){
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
}else{
		
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
	case states.walk:
		sprite_index=s_char_walk;
		break;
	case states.jump:
		sprite_index=s_char_jump;
		break;
}
