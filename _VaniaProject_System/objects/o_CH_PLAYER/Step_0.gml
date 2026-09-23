_keyRight=keyboard_check(ord("D"));
_keyLeft=keyboard_check(ord("A"));
_keyDown=keyboard_check(ord("S"));
_keyUp=keyboard_check(ord("W"));
_keyRun=keyboard_check(ord("J"));
_keyJump=keyboard_check(ord("K"));
_keyAttack00=keyboard_check_pressed(ord("L"));
_keyAttack01=keyboard_check_pressed(ord("O"));



var _sidesensor = collision_line(x+(16*image_xscale),y-128,x+(16*image_xscale),y,_tilemap,1,1);
var _sidebacksensor = collision_line(x-(16*image_xscale),y-128,x-(16*image_xscale),y,_tilemap,1,1);
if _sidebacksensor {x+=move_speed*image_xscale;}
if _sidesensor {x-=move_speed*image_xscale;}
var _floorsensor = collision_line(x-16,y+2,x+16,y+2,_tilemap,1,1);
var _semifloorsensor = collision_line(x-16,y+2,x+16,y+2,o_SOLID_SEMIPLATFORM,1,1);

if _semifloorsensor {if _semifloorsensor._is_solid==true {_isinfloor=true; move_y=0;}
else {
_isinfloor=false;
}}
if _floorsensor  {_isinfloor=true;  move_y=0; } 
if _floorsensor==noone && _semifloorsensor==noone {_isinfloor=false; }
if _isinfloor==false {
 if move_y<12 {move_y+=_gravityforce;}
}



if _canbehurt==true {
var _bodycollision = collision_rectangle(x-15,y-120,x+15,y,o_CH_DMG,1,1);

if _bodycollision { currentHP-=15; _canbehurt=false; _timehurt=3; _currentPlayerState=_playerStates._hurt;}
} else if _canbehurt==false {
if _timehurt>0 {_timehurt-=global._deltaTimeUnit;} else if _timehurt<=0 {_canbehurt=true;}

}





if _keyRun {move_speed=RUN_VELOCITY;} else if !_keyRun {move_speed=WALK_VELOCITY;}

if _currentPlayerState==_playerStates._idle or _currentPlayerState==_playerStates._walk or
_currentPlayerState==_playerStates._run  {
	
	
	if _keyRight {image_xscale=1;}
if _keyLeft {image_xscale=-1;}
	
	
	
	if _isinfloor {move_x=move_speed*(_keyRight - _keyLeft);
if (_isinfloor && keyboard_check_pressed(vk_space)) {_currentPlayerState=_playerStates._jumping; move_y = _jumpspeed;}}
 else if !_isinfloor {_currentPlayerState=_playerStates._jumping;}
}



move_and_collide(move_x,move_y,_tilemap);


switch(_currentPlayerState) {

case _playerStates._inactive:
_infotoshow="_inactive";
break;

case _playerStates._idle :
if _semifloorsensor {if _semifloorsensor._is_solid==true {
if _keyDown { _semifloorsensor._is_solid=false;} 
}}

/*
if _semifloorsensor {if _semifloorsensor._is_solid==true {_isinfloor=true; move_y=0;}
else {
_isinfloor=false;
}}


*/




























if sprite_index!=s_player_side {
	
sprite_index=s_player_side;}

_infotoshow="_idle";


if _isinfloor { 
	
	if _keyAttack01 && _torch>0 {
 target_x =x+(300*image_xscale);
 target_y =y;
dx = target_x - x;
dy = target_y - y; 
_currentPlayerState=_playerStates._attack01;
} 
	
	
	
	if _keyAttack00 {_currentPlayerState=_playerStates._attack00;}
	
	if (_keyLeft or _keyRight) {_currentPlayerState=_playerStates._walk;}} else if !_isinfloor {_currentPlayerState=_playerStates._jumping;}
break;
case _playerStates._walk:

if sprite_index!=s_player_walking {
sprite_index=s_player_walking;}


_infotoshow="_walk";
if _isinfloor && _keyRun  {_currentPlayerState=_playerStates._run;}
if !_isinfloor {_currentPlayerState=_playerStates._jumping;}
if (!_keyLeft and !_keyRight) {_currentPlayerState=_playerStates._idle;}
break;
case _playerStates._run:

if sprite_index!=s_player_running {
sprite_index=s_player_running;}


_infotoshow="_run";
if !_keyRun {if !_keyRight && !_keyLeft {_currentPlayerState=_playerStates._idle;}}
if !_isinfloor {_currentPlayerState=_playerStates._jumping;}

break;
case _playerStates._jumping: 
move_x=move_speed*(_keyRight - _keyLeft);

if _keyAttack00 {_currentPlayerState=_playerStates._attack00;}

	if _keyAttack01 && _torch>0 {
 target_x =x+(300*image_xscale);
 target_y =y;
dx = target_x - x;
dy = target_y - y; 
_currentPlayerState=_playerStates._attack01;
} 

_infotoshow="_jumping";
if _isinfloor==true {_currentPlayerState=_playerStates._idle;}






////if _isinfloor && move_y>2 
break;

case _playerStates._attack00:
_infotoshow="_attack 00";
if sprite_index!=s_player_attack {
sprite_index=s_player_attack;
image_index=0;
}


if image_index==2 && !instance_exists(o_CH_PLAYERDMG) {
var _dmg = instance_create_layer(x+(128*image_xscale),y-64,"Instances",o_CH_PLAYERDMG);

}

break;
case _playerStates._attack01:
_infotoshow="_attack 01";

if sprite_index!=s_player_attack {
sprite_index=s_player_attack;
image_index=0;

var t = clamp(abs(dx) / 8, 20, 45);
var grav = 0.30;

var proj = instance_create_layer(x, y-64, "Instances",o_CH_PLAYERFIREBALL);
proj.grav = grav;
proj.hsp = dx / t;
proj.vsp = (dy - 0.5 * grav * t * t) / t;
}















break;
case _playerStates._hurt:
_infotoshow="_hurt";
if sprite_index!=s_player_hurt {sprite_index=s_player_hurt;}

break;
case _playerStates._dying:
_infotoshow="_dying";
break;


}











/*
_torch = 15;




if instance_exists(o_player) && keyboard_check_pressed(ord("K")) {

var target_x = o_player.x;
var target_y = o_player.y;
o
var dx = target_x - x;
var dy = target_y - y;

 // ajusta esto a tu juego



 }













move_and_collide(
    move_x,
    move_y,
    collision_tilemap,
    4,              // iteraciones
    0,              // xoff
    0,              // yoff
    walk_speed,     // límite horizontal
    max_fall_speed  // límite vertical
);d


_isinfloor=false;
_gravityforce = 0.5;
_maxfallspeed = 12;
_jumpspeed = -10;
///move_y=move_speed*(_keyDown- _keyUp);
