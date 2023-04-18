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
vspd += grav;//---Aplica a gravidade ao personagem---

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
if keyboard_check(ord("D")) and keyboard_check_pressed(vk_shift){
	myd = 0;
	x += dash;
}

if keyboard_check(ord("A")) and keyboard_check_pressed(vk_shift){
	myd = 180;
	x -= dash;
}

if keyboard_check(ord("W")) and keyboard_check_pressed(vk_shift){
	myd = 90;
	y -= dash;
}

if keyboard_check(ord("S")) and keyboard_check_pressed(vk_shift){
	myd = 270;
	y -= dash;
}

if keyboard_check(ord("D")) and keyboard_check(ord("W")) and keyboard_check_pressed(vk_shift){
	myd = 45;
	x += sen;
	y -= sen;
}

if keyboard_check(ord("D")) and keyboard_check(ord("S")) and keyboard_check_pressed(vk_shift){
	myd = 315;
	x += sen;
	y += sen;
}

if keyboard_check(ord("A")) and keyboard_check(ord("W")) and keyboard_check_pressed(vk_shift){
	myd = 135;
	x -= sen;
	y -= sen;
}

if keyboard_check(ord("A")) and keyboard_check(ord("S")) and keyboard_check_pressed(vk_shift){
	myd = 225;
	x -= sen;
	y += sen;
}

#endregion