

//draw_sprite_stretched(spr_window,close_hover,x+shake_x+wave_x,y+shake_y+wave_y,sprite_width,sprite_height);
draw_sprite_ext(spr_window,close_hover,x+shake_x+wave_x,y+shake_y+wave_y,image_xscale,image_yscale,0,-1,1);
close_hover = false;

//draws popup graphic inside the popup window
if(inverted){
    shader_set(sh_invert);
}
if(!PAUSED){
    subimg+=sprite_get_speed(popup_image)/GAME_SPEED;
    if subimg >= sprite_get_number(popup_image) subimg = 0;
}

if(mirrored){
    draw_sprite(popup_image,subimg,x+sprite_width+side_size+shake_x+wave_x,y+top_size+shake_y+wave_y);
} else {
    draw_sprite(popup_image,subimg,x+side_size+shake_x+wave_x,y+top_size+shake_y+wave_y);    
}

shader_reset();
//draw_circle(bbox_right,bbox_top,4,false);

//draw_set_colour(c_red)
//draw_circle(MX,MY,2,false);
//draw_set_colour(c_white)
