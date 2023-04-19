// Draw the full length of the bar
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);

// Draw the cooldown progress
draw_sprite_part_ext(sprite_index, image_index, x, y, 0, 0, image_xscale * cooldown_progress, image_yscale, image_angle, c_blue, image_alpha);