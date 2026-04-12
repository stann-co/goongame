//var progression_text = $"{nirvana}/{nirvana_max}";
//draw_text(2,2,progression_text);

if(global.state == STATE.GAME || global.state == STATE.PAUSE){
    
    var hover = 0;
    if( //if the _x and _y is within the close buttons area
        MX < 53 &&
        MX > 0 &&
        MY > global.gui_h-16 &&
        MY < global.gui_h &&
        global.state == STATE.GAME
    ) {
        hover = 1;
        //click on winscreen button to go back to main menu and restart
        if(mouse_check_button_pressed(mb_left)){
            global.state = STATE.PAUSE;
        }
    }
    draw_sprite(spr_taskbar,hover,0,global.game_h);
    
    #region draw progressbar
    
    var x_ = 85;
    var y_ = global.game_h-15;
    var w_ = 325;
    var h_ = 13;
    
    draw_set_colour(C_BAR_EMPTY);
    draw_rectangle(x_,y_,x_+w_,y_+h_,false);
    
    var progress_ = w_ * (nirvana/nirvana_max);
    
    
    
    draw_set_colour(C_BAR_FULL);
    show_debug_message(global.t);

    if(global.powerup > 0){
        shader_set(sh_rainbow);
        var u_t = shader_get_uniform(sh_rainbow,"u_t");
        shader_set_uniform_f(u_t,global.t);
    }
    draw_rectangle(x_,y_,x_+progress_,y_+h_,false);
    shader_reset();
    
    
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
        
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        
        var menu_h = 30;
        var menu_w = 120;
        x_ = global.gui_w/2;
        
        y_ = (global.gui_h/5)*2;
        
        if(
            MX > x_-menu_w/2 &&
            MX < x_+menu_w/2 &&
            MY > y_-menu_h/2 &&
            MY < y_+menu_h/2
        ){
            var shake_x = random_range(-1,1);
            var shake_y = random_range(-1,1);
            draw_set_colour(C_BAR_FULL)
            draw_text(x_+shake_x,y_+shake_y,"continue"); 
            draw_set_colour(c_white)
            
            if(mouse_check_button_pressed(mb_left)){
                show_debug_message("menu clicked!")
                global.state = STATE.GAME;
            }
        } else draw_text(x_,y_,"continue");
        
        
        y_ = (global.gui_h/5)*3;
        
        if(
            MX > x_-menu_w/2 &&
            MX < x_+menu_w/2 &&
            MY > y_-menu_h/2 &&
            MY < y_+menu_h/2
        ){
            var shake_x = random_range(-1,1);
            var shake_y = random_range(-1,1);
            draw_set_colour(C_BAR_FULL)
            draw_text(x_+shake_x,y_+shake_y,"main menu"); 
            draw_set_colour(c_white)
            
            if(mouse_check_button_pressed(mb_left)){
                show_debug_message("menu clicked!")
                global.state = STATE.MAIN_MENU;
            }
        } else draw_text(x_,y_,"main menu");
    }
    
    if(winning){
        
        var val = winning_t/winning_duration;
        
        draw_set_colour(c_white)
        draw_set_alpha(lerp(0,1,val))
        draw_rectangle(0,0,global.gui_w,global.gui_h,false);
        draw_set_alpha(1);
        
        var y_coom = lerp(global.gui_h+sprite_get_height(spr_coom),0,val);
        
        
        draw_sprite(spr_coom,0,0,y_coom);
        draw_rectangle(0,y_coom,global.gui_w,global.gui_h,false);
        
        if (winning_t < winning_duration) winning_t++
        else{
            win();    
        }
    }
    
} else if (global.state == STATE.MAIN_MENU){
    var hover = 0;
    if( //if the _x and _y is within the close buttons area
        MX < 290 &&
        MX > 160 &&
        MY > 164 &&
        MY < 192
    ) {
        hover = 1;
        //click on main menu start button
        if(mouse_check_button_pressed(mb_left)){
            start_game();
        }
    }
    
    draw_sprite(spr_menu,hover,0,0);
} else if(global.state == STATE.WIN){
    var hover = 0;
    if( //if the _x and _y is within the close buttons area
        MX < 420 &&
        MX > 270 &&
        MY > 70 &&
        MY < 136
    ) {
        hover = 1;
        //click on winscreen button to go back to main menu and restart
        if(mouse_check_button_pressed(mb_left)){
            global.state = STATE.MAIN_MENU;
        }
    }
    
    draw_sprite(spr_win,hover,0,0);
    
    //draw completion time!
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    var x_ = 223;
    var y_ = 178;
    draw_text(x_,y_,timer_text(global.completion_time));
}
