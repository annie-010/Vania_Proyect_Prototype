
camerawidth = camera_get_view_width(view_camera[0]);
cameraheight =  camera_get_view_height(view_camera[0]);
global._deltaTimeUnit = delta_time / 1000000;
global._totalTime += global._deltaTimeUnit;
if keyboard_check_pressed(ord("R")) {game_restart();}
	if (room)==r_InitVar {room_goto_next();}
	
	
	