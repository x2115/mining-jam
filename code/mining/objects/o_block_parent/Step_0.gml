if(!place_free(x,y+1)){
	crumbletimer=crumbletime;	
}else{
	if(crumbletimer>0){
		crumbletimer--;	
	}else if(image_index==1){
		if(place_free(x,y+1)){
			yspd+=0.5;
			while(!place_free(x,y+yspd)&&yspd!=0){
				yspd=max(yspd-.5,0);	
			}
			y+=yspd;
			if(instance_place(x,y,o_char)){
				instance_create_depth(o_char.x,o_char.y,o_char.depth,o_char_dead);
				o_char_dead.facing=o_char.facing;
				instance_destroy(o_char);
			}
		}
	}
}

if(y<global.cam_y-256){
	instance_destroy();	
}
