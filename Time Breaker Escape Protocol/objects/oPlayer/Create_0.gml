/// @description Criação do personagem

hspd = 0;//---Define a velocidade horizontal do personagem no momento---
vspd = 0;//---Define a velocidade vertical do personagem no momento---
walkspeed = 8;//---Define a velocidade básica do andar do personagem---
grav = 2;//---Define a gravidade---
jumpHeight = 22;//---Define a altura do pulo---
maxAirTime = 3;//---Define o tempo máximo em frames que o jogador pode pular após sir o chão---
airTime = 0;//---Checa por quanto tempo o jogador já esteve no ar---

dashSpeed = 20; //---Define a velocidade do dash---
dashDuration = 50; //---Duração do dash em frames---
dashCooldown = 20; //---Define o tempo de espera entre cada dash---
dashTimer = 0; //---Define um timer que termina o dash---
canDash = true; //---Define se o jogador pode opou não executar o dash---