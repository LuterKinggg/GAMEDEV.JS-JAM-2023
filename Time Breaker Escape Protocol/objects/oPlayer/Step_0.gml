/// @description Eventos Principais

#region //Variáveis Úteis
///---------VARIÁVEIS ÚTEIS---------
right = keyboard_check(vk_right) or keyboard_check(ord("D"));//---Checa se o jogador aperta pra direita---
left = keyboard_check(vk_left) or keyboard_check(ord("A"));//---Checa se o jogador aperta pra esquesda---
jump = keyboard_check_pressed(vk_space) or keyboard_check_pressed(vk_up);//---Checa se o jogador aperta pra pular---
onGround = place_meeting(x, y + 1, oWall);//---Checa se o jogador pode pular---
canJump = false;//---Define se o jogador pode ou não pular---
#endregion

#region //Posições Úteis
//---Posições Úteis---
foot = (y + (sprite_height/2));
#endregion

#region //Movimento Vertical
///---------MOVIMENTO VERTICAL---------
if applygrav == true {
	vspd += grav;//---Aplica a gravidade ao personagem---
}

if onGround{//---Faz o jogador poder pular quando no chão---
canJump = true;
}

if jump and canJump{//---Checa se o jogador tenta e pode pular---
	vspd -= jumpHeight;
	alarm[0] = 5;
}

if (keyboard_check_released(vk_space) or keyboard_check_released(vk_up)) and (vspd < 0){//---Habilita pulos de tamannhos variados---
	vspd += jumpHeight/2;
}

if place_meeting(x, y + vspd, oWall){//---Checa a colisão com a parede verticalmente---
	while (!place_meeting(x, y + sign(vspd), oWall)){
		y += sign(vspd);
	}
	vspd = 0;
}

if vspd >= 100{//---Limita a velocidade de queda do personagem---
vspd = 100;
}

y += vspd;//---Move o personagem verticalmente depois de calcular sua velocidade---
#endregion

#region //Movimento Horizontal
///---------MOVIMENTO HORIZOLTAL---------
hspd = 0; //---Reseta a velocidade do personagem---

if left{//---Checa se o personagem tenta andar pra esquerda---
	hspd -= walkspeed;
	image_xscale = -1;
}

if right{//---Checa se o personagem tenta andar pra direita---
	hspd += walkspeed;
	image_xscale = 1;
}

if place_meeting(x + hspd, y, oWall){//---Checa a colisão com a parede horizontalmente---
	while (!place_meeting(x + sign(hspd), y, oWall)){
		x += sign(hspd);
	}
	hspd = 0;
}

x += hspd;//---Move o personagem horizontalmente depois de calcular sua velocidade---
#endregion

#region // dash
// verifica o input do dash
if keyboard_check_pressed(vk_shift) && dash_ready {
    // define o timer do dash
    dash_timer = dash_duration;
    // define a direção do dash
    if keyboard_check(vk_right) {
        hspd = dash_speed;
    } else if keyboard_check(vk_left) {
        hspd = -dash_speed;
    }
    // define o cooldown do dash
    dash_ready = false;
    alarm[0] = dash_cooldown;
}

// atualiza o dash
if dash_timer > 0 {
    // move o player
	applygrav = false;
	vspd = 0;
	x += hspd * 3;
    // dimiinui a duração do dash
    dash_timer--;
    // acado o dash se acabar o tempo
    if dash_timer <= 0 {
        hspd = 0;
		applygrav = true;
    }
}

// atualiza o cooldown do dash
if !dash_ready {
    // diminui o contador do dash
    alarm[0]--;
    // reseta o alarme
    if alarm[0] <= 0 {
        dash_ready = true;
    }
}
#endregion