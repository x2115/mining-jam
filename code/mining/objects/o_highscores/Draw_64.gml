draw_set_halign(fa_center);
draw_set_font(font_main);
draw_text(room_width/2,48,"Score:");
draw_text(room_width/2,92,"Previous Best");
draw_set_font(global.numfont);
draw_text(room_width/2,64,global.score);
draw_text(room_width/2,106,previous_score);
