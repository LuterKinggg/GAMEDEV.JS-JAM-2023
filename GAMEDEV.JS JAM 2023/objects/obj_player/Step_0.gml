// aplicar gravidade
if (onGround == false) {
	vsp += gravity
}

// movimento horizontal
hsp = 0;
if (keyboard_check(vk_left) or keyboard_check(ord("A"))) {
	hsp -= movespeed;
}

if (keyboard_check(vk_right) or keyboard_check(ord("D"))) {
	hsp += movespeed;
}

// pulo
if (onGround && keyboard_check_pressed(vk_space) && !place_meeting(x, y - 1, obj_wall)) {
    vsp = -jumpspeed;
}

// aplicar atrito
hsp *= friction;

// atualizar velocidade horizontal
x += hsp;

// colisão horizontal
if (place_meeting(x, y, obj_wall)) {
    while (!place_free(x+sign(hsp),y)) { 
        x += sign(hsp);
    }
    hsp = 0;
}

// atualizar velocidade vertical


// colisão vertical
if (place_meeting(x, y + 1, obj_wall)) {
    vsp = 0;
} else {
	
}



// testar se está no chão
if (place_meeting(x, y + 1, obj_wall)) {
    onGround = true;
} else {
    onGround = false;
}