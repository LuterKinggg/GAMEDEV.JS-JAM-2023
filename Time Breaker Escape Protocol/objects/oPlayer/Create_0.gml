/// @description Criação do personagem

hspd = 0;//---Define a velocidade horizontal do personagem no momento---
vspd = 0;//---Define a velocidade vertical do personagem no momento---
walkspeed = 4;//---Define a velocidade básica do andar do personagem---
grav = 1;//---Define a gravidade---
jumpHeight = 16;//---Define a altura do pulo---

dash_speed = 50; // the speed at which the player dashes
dash_duration = 10; // the duration of the dash in frames
dash_cooldown = 0; // the cooldown between dashes in frames
dash_timer = 0; // the current frame of the dash
dash_ready = true; // whether or not the dash is available
