// @description Criação do personagem

hspd = 0;//---Define a velocidade horizontal do personagem no momento---
vspd = 0;//---Define a velocidade vertical do personagem no momento---
walkspeed = 6;//---Define a velocidade básica do andar do personagem---
grav = 3.5;//---Define a gravidade---
jumpHeight = 26;//---Define a altura do pulo---
maxAirTime = 3;//---Define o tempo máximo em frames que o jogador pode pular após sir o chão---
airTime = 0;//---Checa por quanto tempo o jogador já esteve no ar---

dashSpeed = 14; //---Define a velocidade do dash---
dashDuration = 10; //---Duração do dash em frames---
dashCooldown = 20; //---Define o tempo de espera entre cada dash---
dashTimer = 0; //---Define um timer que termina o dash---
canDash = true; //---Define se o jogador pode opou não executar o dash---

//--Define o id das layers, para o Paralaxe
layer0 = layer_get_id("Backgrounds_0");
layer1 = layer_get_id("Backgrounds_1");
layer2 = layer_get_id("Backgrounds_2");
layer3 = layer_get_id("Backgrounds_3");
layer4 = layer_get_id("Backgrounds_4");
layer5 = layer_get_id("Backgrounds_5");
layer6 = layer_get_id("Backgrounds_6");