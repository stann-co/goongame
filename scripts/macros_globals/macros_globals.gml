#macro MX global.camera.get_mouse_x()
#macro MY global.camera.get_mouse_y()

#macro GAME_SPEED game_get_speed(gamespeed_fps) 

global.t = 0; //timer that keeps going up

global.hovered = noone; //the current hovered element


#region particles
global.part_stars = part_type_create();
part_type_sprite(global.part_stars,spr_stars,false,false,true);
//part_type_shape(global.part_stars,pt_shape_star);
//part_type_colour_hsv(global.part_stars, 0, 255, 150, 150, 255, 255);
part_type_size(global.part_stars,0.4,0.45,-0.012,0);
part_type_direction(global.part_stars,0,360,0,10);
part_type_life(global.part_stars,60,60);
part_type_speed(global.part_stars,3,4,-0.18,0);
part_type_alpha3(global.part_stars,1,1,0);
//part_type_gravity(global.part_stars,0.05,270);
part_type_orientation(global.part_stars,0,360,2,1,false);
#endregion