if(instance_exists(o_char)){
	var cy=o_char.y-setup.screen_height*0.6
	if(cy>global.cam_y){
		global.cam_y=lerp(global.cam_y,cy,0.1);
	}
}
get_input();

if(down){
	global.cam_offset=lerp(global.cam_offset,32,offspd);	
}else{
	global.cam_offset=lerp(global.cam_offset,0,offspd);
}
camera_set_view_pos(view_camera[0],0,global.cam_y+global.cam_offset);
