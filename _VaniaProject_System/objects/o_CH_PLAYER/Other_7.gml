if sprite_index==s_player_attack {
if _isinfloor {_currentPlayerState=_playerStates._idle;} else if !_isinfloor {
_currentPlayerState=_playerStates._jumping;
}
}

if sprite_index==s_player_hurt {if _isinfloor {_currentPlayerState=_playerStates._idle;} else if !_isinfloor {
_currentPlayerState=_playerStates._jumping;
}}