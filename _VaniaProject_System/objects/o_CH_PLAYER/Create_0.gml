move_x=0   //*();
move_y=0   //move_speed*();
move_speed= 3;


maxHp=100;
currentHP=maxHp;
minHp=0;


_canbehurt=false;
_timehurt=0;


///FUTUREMACROS///
#macro WALK_VELOCITY 3 
#macro RUN_VELOCITY 6

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
_keyAttack01=0;

_isinfloor=false;
_gravityforce = 0.5;
_maxfallspeed = 10;
_jumpspeed = -15;

alarm[0]=1;


_torch = 15;

 target_x =0;
 target_y =0;
dx =0;
dy =0;



if !(instance_exists(o_CH_MENUINGAME)) {
_menu = instance_create_layer(x,y,"Instances",o_CH_MENUINGAME);
}
