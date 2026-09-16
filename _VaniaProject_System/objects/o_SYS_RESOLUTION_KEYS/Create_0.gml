global._deltaTimeUnit = 0;
global._totalTime = 0;

var camera_width = 1366;
var camera_height = 768;

view_camera[0] = camera_create_view( 0,0,camera_width, camera_height);
display_set_gui_size(1366, 768);
camerawidth = camera_get_view_width(view_camera[0]);
cameraheight = camera_get_view_height(view_camera[0]);


_tilemap = layer_tilemap_get_id("TileSet_Collision");


/*
global._deltaTimeUnit = 0
global._totalTime = 0;
view_camera[0] = camera_create();
cameramusfollowto = noone;
display_set_gui_size(1366,768);
camerawidth = 0;
cameraheight = 0;
