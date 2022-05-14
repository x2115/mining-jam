function mine_block(block){
	if(instance_exists(block)){
		if(block.crumbletimer==0){
			if(block.image_index==0){
				if(y>block.y){
					block.crumbletimer=block.crumbletime;
				}
				block.image_index++;	
			}else{
				instance_destroy(block);	
			}
		}
	}
}

function can_mine(){
	switch(aimdir){
		case dirs.forwards: block=position_meeting(x+facing*8,y-8,o_block_parent); break;
		case dirs.down: block=position_meeting(x,y+3,o_block_parent); break;
		case dirs.up: block=position_meeting(x,y-19,o_block_parent); break;
	}
	if(!block){
		return false
	}
	return true;	
}
function build_chunk(chunk_pos,height){
	var lime_chance=0.1;
	var void_chance=0.1;
	var cracked_chance=0.15;
	for(var iy=0;iy<height;iy+=setup.grid_height){
		instance_create_depth(-16,iy+chunk_pos,1,o_block_edge);
		instance_create_depth(room_width,iy+chunk_pos,1,o_block_edge);
		for(var ix=0;ix<room_width;ix+=setup.grid_width){
			var o=o_block_marble;
			if(random(1)<lime_chance){
				o=o_block_limestone;	
			}
			if(random(1)>void_chance){
				var b=instance_create_depth(ix,iy+chunk_pos,1,o);
				if(random(1)<cracked_chance){
					b.image_index=1;	
				}
			}
		}
	}
}

function empty_at_relative(x_grid_offset,y_grid_offset){
	return !position_meeting(x+8+setup.grid_width*x_grid_offset,y+8+setup.grid_width*y_grid_offset,o_block_parent)&&!position_meeting(x+8+setup.grid_width*x_grid_offset,y+8+setup.grid_width*y_grid_offset,o_block_edge);	
}
function marble_at_relative(x_grid_offset,y_grid_offset){
	var m=instance_position(x+8+setup.grid_width*x_grid_offset,y+8+setup.grid_width*y_grid_offset,o_block_marble);
	return instance_exists(m)&&m.image_index==0;	
}

function check_for_rectangle(){
	var options=[
		[
			[0,0,0,0],
			[0,1,1,0],
			[0,1,1,0],
			[0,0,0,0],
		],
		[
			[0,0,0,0,0],
			[0,1,1,1,0],
			[0,1,1,1,0],
			[0,1,1,1,0],
			[0,0,0,0,0],
		],
		[
			[0,0,0,0,0,0],
			[0,1,1,1,1,0],
			[0,1,1,1,1,0],
			[0,1,1,1,1,0],
			[0,1,1,1,1,0],
			[0,0,0,0,0,0],
		],
		[
			[0,0,0,0,0,0,0],
			[0,1,1,1,1,1,0],
			[0,1,1,1,1,1,0],
			[0,1,1,1,1,1,0],
			[0,1,1,1,1,1,0],
			[0,1,1,1,1,1,0],
			[0,0,0,0,0,0,0],
		]
	]
	var found=false;
	for(var i=0;i<array_length(options);i++){
		var possible=true;
		for(var iy=0;iy<array_length(options[i]);iy++){
			for(var ix=0;ix<array_length(options[i][iy]);ix++){
				var v=options[i][iy][ix];
				if(v){
					var r=marble_at_relative(ix-1,iy-1);
				}else{
					var r=empty_at_relative(ix-1,iy-1);	
				}
				if(!r){
					possible=false;
					break;
				}
			}
			if(!possible){
				break;
			}
		}
		if(possible){
			found=true;
			break;
		}
	}
	if(found){
		destroy_square(i+2);	
	}
}

function destroy_square(size){
	for(var ix=0;ix<size;ix++){
		for(var iy=0;iy<size;iy++){
			var b=instance_position(x+8+setup.grid_width*ix,y+8+setup.grid_height*iy,o_block_marble);
			if(instance_exists(b)){
				instance_destroy(b);	
			}
		}
	}
	global.score+=size*size*size*50;
	global.end_time+=(size-1)*5000;
}


