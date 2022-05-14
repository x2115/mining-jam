draw_set_font(global.numfont);
draw_set_halign(fa_center);
draw_text(setup.screen_width/2,4,x_digit_number(global.score,8));
draw_text(setup.screen_width/2,16,time_string(global.end_time-current_time));
draw_set_halign(fa_left);
