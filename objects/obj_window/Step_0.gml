if(moving){ 
    if(moving_right) x+=1 
    else x-= 1;
        
    if(moving_up) y-=1 
    else y+= 1;
        
    if(bbox_left < 0) moving_right = true;
        
    if(bbox_right > global.game_w) moving_right = false;
        
    if(bbox_top < 0 ) moving_up = false;
        
    if (bbox_bottom > global.game_h) moving_up = true;
}