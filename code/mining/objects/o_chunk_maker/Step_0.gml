if(instance_exists(o_char)&&o_char.y>chunk_val){
	chunk_val+=chunk_height;
	build_chunk(chunk_val,chunk_height);
}

