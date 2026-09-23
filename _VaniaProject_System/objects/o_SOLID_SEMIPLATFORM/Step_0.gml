if _is_solid==false { 
	if _timetogetsolid<2 {_timetogetsolid+=global._deltaTimeUnit;} else {
	_timetogetsolid=0; _is_solid=true;
	}
	
	}
