//Gravidade
if !place_meeting(x, y + 1, obj_wall){
	y += vspd
}
else{
	//Pulo
	if keyboard_check_pressed(vk_space){
		i = y
		while !place_meeting(x, y - 1, obj_wall) and y != i - 48{
			y --
		}
}
}

//Movimentação e Colisão
if keyboard_check(vk_right) and !place_meeting(x + 1, y, obj_wall) or keyboard_check(ord("D")) and !place_meeting(x + 1, y, obj_wall){
	x = x + hspd
}

if keyboard_check(vk_left) and !place_meeting(x - 1, y, obj_wall) or keyboard_check(ord("A")) and !place_meeting(x - 1, y, obj_wall){
	x = x - hspd
}