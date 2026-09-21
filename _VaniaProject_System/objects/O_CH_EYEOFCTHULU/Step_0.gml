if instance_exists(o_CH_PLAYER) {
	if place_meeting(x,y,o_CH_PLAYERDMG) {instance_destroy();}
	
	var _target = o_CH_PLAYER;
	var _distance = point_distance(x,y,o_CH_PLAYER.x,o_CH_PLAYER.y);
	if _distance<=200 {
		path_speed=0;
		move_towards_point(_target.x,_target.y,5);
if _target.x>x {image_xscale=1;}

if _target.x<x {image_xscale=-1;}
}else {
if  path_to_move==noone {
path_to_move=choose(path_eyeofcthulu_00,path_eyeofcthulu_1);
path_start(path_to_move,4,path_action_reverse,0);
}


}}