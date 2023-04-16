// apply gravity
vsp += gravity

// horizontal movement
hsp = 0;
if (keyboard_check(vk_left) or keyboard_check(ord("A"))) hsp -= movespeed;
if (keyboard_check(vk_right) or keyboard_check(ord("D"))) hsp += movespeed;

// jump
if (onGround && keyboard_check_pressed(vk_space) && !place_meeting(x, y - 1, obj_wall)) {
    vsp = -jumpspeed;
}

// apply friction
hsp *= friction;

// move horizontally
x += hsp;

// check for collisions horizontally
if (place_meeting(x, y, obj_wall)) {
    while (!place_free(x+sign(hsp),y)) { 
        x += sign(hsp);
    }
    hsp = 0;
}

// move vertically
y += vsp;

// check for collisions vertically
if (place_meeting(x, y + 1, obj_wall)) {
    while (place_meeting(x, y + 1, obj_wall)) {
        y -= 1;
    }
    vsp = 0;
    onGround = true;
} else {
    onGround = false;
}