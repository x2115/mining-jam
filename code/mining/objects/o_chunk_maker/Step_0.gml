if(instance_exists(o_char)&&o_char.y>chunk_val){
	chunk_val+=chunk_height;
	build_chunk(chunk_val,chunk_height);
}

show_debug_message(instance_number(o_block_marble));
