

draw_sprite_stretched(spr_window,close_hover,x+shake_x+wave_x,y+shake_y+wave_y,sprite_width,sprite_height);
close_hover = false;

//draws popup graphic inside the popup window
if(inverted){
    shader_set(sh_invert);
}
draw_sprite(popup_image,0,x+side_size+shake_x+wave_x,y+top_size+shake_y+wave_y);
shader_reset();
//draw_circle(bbox_right,bbox_top,4,false);

//draw_set_colour(c_red)
//draw_circle(MX,MY,2,false);
//draw_set_colour(c_white)
