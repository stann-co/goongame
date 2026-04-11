//var progression_text = $"{nirvana}/{nirvana_max}";
//draw_text(2,2,progression_text);

if(global.state == STATE.GAME || global.state == STATE.PAUSE){

    draw_sprite(spr_taskbar,0,0,global.game_h);
    
    #region draw progressbar
    
    var x_ = 85;
    var y_ = global.game_h-15;
    var w_ = 325;
    var h_ = 13;
    
    draw_set_colour(C_BAR_EMPTY);
    draw_rectangle(x_,y_,x_+w_,y_+h_,false);
    
    var progress_ = w_ * (nirvana/nirvana_max);
    
    draw_set_colour(C_BAR_FULL);
    draw_rectangle(x_,y_,x_+progress_,y_+h_,false);
    
    draw_set_colour(c_white);
    
    draw_sprite(spr_progress_frame,0,x_,y_);
    
    #endregion 
    
    if(global.state == STATE.PAUSE){
        //draws darkness over game when paused
        draw_set_colour(c_black)
        draw_set_alpha(0.5)
        draw_rectangle(0,0,global.gui_w,global.gui_h,false);
        draw_set_colour(c_white)
        draw_set_alpha(1)
        
        //draws pause menu
    }
    
}
