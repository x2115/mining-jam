function move_towards_zero(n,a){
	if(n>0){
		return max(n-a,0);	
	}else{
		return min(n+a,0);	
	}
}

function time_string(milliseconds){
		var totalseconds=milliseconds div 1000;
		var seconds=totalseconds mod 60;
		var minutes=totalseconds div 60;
		return string(minutes)+":"+x_digit_number(seconds,2);
}

function x_digit_number(number,length){
	var ret=string(number);
	while(string_length(ret)<length){
		ret="0"+ret;	
	}
	return ret;
}
