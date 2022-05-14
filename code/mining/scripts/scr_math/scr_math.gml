function move_towards_zero(n,a){
	if(n>0){
		return max(n-a,0);	
	}else{
		return min(n+a,0);	
	}
}
