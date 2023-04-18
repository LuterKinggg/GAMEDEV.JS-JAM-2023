/// Movimenta a camera
if not instance_exists(oPlayer) exit;

x = lerp (x, oPlayer . x, 0.1);
y = lerp (y, oPlayer . y - height/4, 0.1);

camera_set_view_pos(view_camera[0],x - width/2, y-height/2);