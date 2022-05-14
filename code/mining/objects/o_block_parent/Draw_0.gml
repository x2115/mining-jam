var dx=x;
if(image_index==1&&crumbletimer!=0&&crumbletimer!=crumbletime){
	dx=x+random(2)-1;
}
draw_sprite(sprite_index,image_index,dx,y);
