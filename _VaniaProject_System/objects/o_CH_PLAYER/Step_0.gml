_keyRight=keyboard_check(ord("D"));
_keyLeft=keyboard_check(ord("A"));
_keyDown=keyboard_check(ord("S"));
_keyUp=keyboard_check(ord("W"));
_keyRun=keyboard_check(ord("J"));
_keyJump=keyboard_check(ord("K"));
_keyAttack00=keyboard_check_pressed(ord("L"));

var _sidesensor = collision_line(x+(16*image_xscale),y-128,x+(16*image_xscale),y,_tilemap,1,1);
var _sidebacksensor = collision_line(x-(16*image_xscale),y-128,x-(16*image_xscale),y,_tilemap,1,1);
if _sidebacksensor {x+=move_speed*image_xscale;}

if _sidesensor {x-=move_speed*image_xscale;}

var _floorsensor = collision_line(x,y,x,y+1,_tilemap,1,1);
if _floorsensor {_isinfloor=true;} else if !_floorsensor {
_isinfloor=false;}



if _canbehurt==true {
var _bodycollision = collision_rectangle(x-15,y-120,x+15,y,o_CH_DMG,1,1);

if _bodycollision { currentHP-=15; _canbehurt=false; _timehurt=3; _currentPlayerState=_playerStates._hurt;}
} else if _canbehurt==false {
if _timehurt>0 {_timehurt-=global._deltaTimeUnit;} else if _timehurt<=0 {_canbehurt=true;}

}








move_y += _gravityforce;
move_y = min(move_y,_maxfallspeed);

if _keyRight {image_xscale=1;}
if _keyLeft {image_xscale=-1;}




if _keyRun {move_speed=RUN_VELOCITY;} else if !_keyRun {move_speed=WALK_VELOCITY;}

if _currentPlayerState==_playerStates._idle or _currentPlayerState==_playerStates._walk or
_currentPlayerState==_playerStates._run  {
	
	if _isinfloor {move_x=move_speed*(_keyRight - _keyLeft);
if (_isinfloor && keyboard_check_pressed(vk_space)) {_currentPlayerState=_playerStates._jumping; move_y = _jumpspeed;}}
 else if !_isinfloor {_currentPlayerState=_playerStates._jumping;}
}



move_and_collide(move_x,move_y,_tilemap,4,0,0,move_speed,12);


switch(_currentPlayerState) {

case _playerStates._inactive:
_infotoshow="_inactive";
break;

case _playerStates._idle :

if sprite_index!=s_player_side {
sprite_index=s_player_side;}

_infotoshow="_idle";


if _isinfloor { 
	if _keyAttack00 {_currentPlayerState=_playerStates._attack00;}
	
	if (_keyLeft or _keyRight) {_currentPlayerState=_playerStates._walk;}} else if !_isinfloor {_currentPlayerState=_playerStates._jumping;}
break;
case _playerStates._walk:
_infotoshow="_walk";
if _isinfloor && _keyRun  {_currentPlayerState=_playerStates._run;}
if !_isinfloor {_currentPlayerState=_playerStates._jumping;}
if (!_keyLeft and !_keyRight) {_currentPlayerState=_playerStates._idle;}
break;
case _playerStates._run:
_infotoshow="_run";
if !_keyRun {if !_keyRight && !_keyLeft {_currentPlayerState=_playerStates._idle;}}
if !_isinfloor {_currentPlayerState=_playerStates._jumping;}

break;
case _playerStates._jumping: 
move_x=move_speed*(_keyRight - _keyLeft);

_infotoshow="_jumping";
var _floorsensorinJump = collision_line(x,y,x,y+1,_tilemap,1,1);
if _floorsensorinJump  {_isinfloor=true;}
if _isinfloor==true {_currentPlayerState=_playerStates._idle;}

////if _isinfloor && move_y>2 
break;

case _playerStates._attack00:
_infotoshow="_attack 00";
if sprite_index!=s_player_attack {
sprite_index=s_player_attack;
image_index=0;
}
break;
case _playerStates._attack01:
_infotoshow="_attack 01";
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
