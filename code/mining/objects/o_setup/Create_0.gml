enum setup{
	grid_width=16,
	grid_height=16,
	screen_width=256,
	screen_height=144,
}
randomize();
display_set_gui_size(setup.screen_width,setup.screen_height);

global.numfont=font_add_sprite(sprfont_numbers,ord("0"),true,-1);

room_goto_next();
