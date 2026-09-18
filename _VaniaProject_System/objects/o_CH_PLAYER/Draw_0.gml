draw_set_color(c_white)

draw_text(x+64,y-64,"_timehurt :" + string(_timehurt));
draw_text(x+64,y-96,"_canbehurt :" + string(_canbehurt));

draw_text(x-32,y-130,"HP :" + string(currentHP));


if _canbehurt {draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,1,0,c_white,1); } else {
	
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,1,0,c_white,.2);}
draw_text(x-64,y-140,"  " + string(_infotoshow));