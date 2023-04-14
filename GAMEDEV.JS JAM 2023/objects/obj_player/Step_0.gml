//Gravidade
if !place_meeting(x, y + 1, obj_wall){
	y ++
}

//Movimentação
if keyboard_check(vk_up){
	y --
}

if keyboard_check(vk_right) and !place_meeting(x + 1, y, obj_wall){
	x ++
}

if keyboard_check(vk_left) and !place_meeting(x - 1, y, obj_wall){
	x --
}