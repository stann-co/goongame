if(shaking){
    shake_x = random_range(-4,4);
    shake_y = random_range(-4,4);
}

draw_sprite_stretched(spr_window,global.hovered == id,x+shake_x,y+shake_y,sprite_width,sprite_height);

//draws popup graphic inside the popup window
if(inverted){
    shader_set(sh_invert);
}
draw_sprite(popup_image,0,x+side_size+shake_x,y+top_size+shake_y);
shader_reset();
//draw_circle(bbox_right,bbox_top,4,false);

//draw_set_colour(c_red)
//draw_circle(MX,MY,2,false);
//draw_set_colour(c_white)
