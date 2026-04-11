draw_sprite_stretched(spr_window,global.hovered == id,x,y,sprite_width,sprite_height);


var popup_graphic = spr_popup;
var x_ = x+side_size;
var y_ = y+top_size;
var w_ = sprite_width-(side_size*2);
var h_ = sprite_height-top_size-side_size;

//draws popup graphic inside the popup window
draw_sprite_stretched(spr_popup,0,x_,y_,w_,h_);
//draw_circle(bbox_right,bbox_top,4,false);

//draw_set_colour(c_red)
//draw_circle(MX,MY,2,false);
//draw_set_colour(c_white)
