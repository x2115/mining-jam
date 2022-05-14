function get_input(){
	left=keyboard_check(ord("A"))||keyboard_check(vk_left);
	right=keyboard_check(ord("D"))||keyboard_check(vk_right);
	up=keyboard_check(ord("W"))||keyboard_check(vk_up);
	down=keyboard_check(ord("S"))||keyboard_check(vk_down);
	jump=keyboard_check(ord("X"))||keyboard_check(vk_space);
	mine=keyboard_check(ord("Z"))||mouse_check_button(mb_left);
}
