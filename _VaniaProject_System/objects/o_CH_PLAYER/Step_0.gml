_keyRight=keyboard_check_direct(ord("D"));
_keyLeft=keyboard_check_direct(ord("A"));
_keyDown=keyboard_check_direct(ord("S"));
_keyUp=keyboard_check_direct(ord("W"));


move_x=move_speed*(_keyRight - _keyLeft);
move_y=move_speed*(_keyDown- _keyUp);

move_and_collide(move_x,move_y,_tilemap);