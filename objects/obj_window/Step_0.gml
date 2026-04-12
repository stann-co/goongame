if (!PAUSED){
    if(moving){ 
        
        var spd = powerup ? 2 : 1;
        
        if(moving_right) x+=spd
        else x-= spd;
            
        if(moving_up) y-=spd 
        else y+= spd;
            
        if(bbox_left < 0) moving_right = true;
            
        if(bbox_right > global.game_w) moving_right = false;
            
        if(bbox_top < 0 ) moving_up = false;
            
        if (bbox_bottom > global.game_h) moving_up = true;
    }
    
    if(waving){
        wave_x = sin(global.t/4)*8;
        wave_y = sin((global.t)/5)*8;
    }
    
    if(shaking){
        shake_x = random_range(-2,2);
        shake_y = random_range(-2,2);
    }
}