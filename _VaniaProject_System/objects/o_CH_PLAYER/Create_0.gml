move_x=0   //*();
move_y=0   //move_speed*();
move_speed= 3;


///FUTUREMACROS///
#macro WALK_VELOCITY 4 
#macro RUN_VELOCITY 8

enum _playerStates {_inactive,_idle,_walk,_run,_jumping,_attack00,_attack01,_hurt,_dying,_menu}
_currentPlayerState = _playerStates._inactive;

_infotoshow="";

_tilemap=layer_tilemap_get_id("TileSet_Collision");

_keyRight=0 ;
_keyLeft=0;
_keyDown=0;
_keyUp=0;
_keyRun=0;
_keyJump=0;
_keyAttack00=0;


_isinfloor=false;
_gravityforce = 0.5;
_maxfallspeed = 12;
_jumpspeed = -10;

alarm[0]=1;