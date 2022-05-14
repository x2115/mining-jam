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

function build_chunk(chunk_pos,height){
	var lime_chance=0.3;
	var void_chance=0.2;
	for(var ix=0;ix<room_width;ix+=setup.grid_width){
		for(var iy=0;iy<height;iy+=setup.grid_height){
			var o=o_block_marble;
			if(random(1)<lime_chance){
				o=o_block_limestone;	
			}
			if(random(1)>void_chance){
				instance_create_depth(ix,iy+chunk_pos,1,o);
			}
		}
	}
}

function check_for_rectangle(){
		
}
