/// @description Eventos Principais

#region //Variáveis Úteis
///---------VARIÁVEIS ÚTEIS---------
right = keyboard_check(vk_right) or keyboard_check(ord("D"));//---Checa se o jogador aperta pra direita---
left = keyboard_check(vk_left) or keyboard_check(ord("A"));//---Checa se o jogador aperta pra esquesda---
jump = keyboard_check_pressed(vk_space) or keyboard_check_pressed(vk_up);//---Checa se o jogador aperta pra pular---
dash = keyboard_check_pressed(vk_shift);//---Checa se o jogador aperta para executar o dash---
onGround = place_meeting(x, y + 1, oWall);//---Checa se o jogador pode pular---
canJump = false;//---Define se o jogador pode ou não pular---
#endregion

#region //Posições Úteis
//---Posições Úteis---
foot = (y + (sprite_height/2) - 1);
#endregion

#region //Movimento Vertical
///---------MOVIMENTO VERTICAL---------
vspd += grav;//---Aplica a gravidade ao personagem---

if onGround{//---Faz o jogador poder pular quando no chão---
	canJump = true;
	airTime = 0;
} else {airTime += 1;}//---Mantém guardado por quanto tempo o jogador já esteve no ar---

if airTime < maxAirTime{//---Faz o jogador poder pular por um tempo após sair do chão---
	canJump = true;
} else { canJump = false; }

if jump and canJump{//---Checa se o jogador tenta e pode pular---
	vspd -= jumpHeight;//---Aplica a velocidade do pulo no movimento vertical---
	canJump = false;
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

if dashTimer > 0{//---Para a movimento vertical durante o dash---
	vspd = 0;
}

y += vspd;//---Move o personagem verticalmente depois de calcular sua velocidade---
#endregion

#region //Movimento Horizontal
///---------MOVIMENTO HORIZOLTAL---------
hspd = 0; //---Reseta a velocidade do personagem---

if left and !(dashTimer > 0){//---Checa se o personagem tenta e pode andar pra esquerda---
	hspd -= walkspeed;
	image_xscale = -1;
}

if right and !(dashTimer > 0){//---Checa se o personagem tenta e pode andar pra direita---
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

#region // Dash
if dash and canDash {//---Checa se o jogador tenta e pode executar um dash---
    dashTimer = dashDuration;//---Define a duração do dash---
    canDash = false;//---Previne o jogador de executatar um dash após o outro---
    alarm[1] = dashCooldown;//---Define o tempo de espera entre cada dash---
}

if dashTimer > 0 {//---Checa se o dash ainda está acontecendo---
	hspd = dashSpeed * image_xscale;//---Muda a direção do dash dependendo da direção do player e aplica a velocidade correta---
	if place_meeting(x + hspd, y, oWall){//---Checa a colisão horizontal novamente para prevenir wallclips---
		while (!place_meeting(x + sign(hspd), y, oWall)){
			x += sign(hspd);
		}
		hspd = 0;
	}
	if place_meeting(x, y, oWall){//---Checa a colisão mais uma vez---
		while place_meeting(x, y, oWall){
			x -= sign(hspd);
		}
	}
    x += hspd;//---Move o player baseado na velocidade modificada pelo dash---
    dashTimer--;//---Faz o timer do dash funcionar---
    if dashTimer <= 0 {//---Para o dash quando o timer termina---
        hspd = 0;
    }
}
#endregion

if hspd = 0 and onGround{
	sprite_index = sPlayerIdle;
}
if hspd != 0 and onGround{
	sprite_index = sPlayer
}