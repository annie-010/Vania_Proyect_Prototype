draw_set_font(fnt_debug);
draw_set_colour(c_black);
draw_set_alpha(.3);
draw_rectangle(32,16,340,200,0);
draw_set_alpha(1);
draw_set_colour(c_white);

draw_text(64,32,("Camara Ancho : ") + string(camerawidth));
draw_text(64,64,("Camara Alto : ") + string(cameraheight));
draw_text(64,96,("Valor Delta time : ") + string(global._deltaTimeUnit));
draw_text(64,128,("Tiempo Transcurrido : ") + string(global._totalTime));
draw_text(64,160,("Habitacion Actual : ") + string(room_get_name(room)));

draw_sprite_ext(s_FX,0,0,0,1,1,0,c_white,0.3);