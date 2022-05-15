ini_open("savedata.ini");
previous_score=ini_read_real("score","highscore",0);
if(global.score>previous_score){
	ini_write_real("score","highscore",global.score);	
}
ini_close();
