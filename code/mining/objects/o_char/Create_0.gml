enum states{
	idle,
	wobbling,
	walk,
	mine,
	jump
}

enum dirs{
	up,
	forwards,
	down
}

state=states.idle;
aimdir=dirs.forwards;
facing=1;

xspd=0;
yspd=0;

accel=0.25;
fric=accel/2;

mspd=1.1;
grav=0.3;
jspd=3.2;
minecdtime=4;
minecdtimer=minecdtime;
coyotetime=3;
coyotetimer=coyotetime;
y=-4;
instance_create_depth(x,y,depth,o_camera);
