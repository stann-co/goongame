//mouse cursor checks for collisions and input with windows and buttons

if (global.state == STATE.GAME){
    
    #region mouse click
    var windows = ds_list_create();
    var size = instance_position_list(MX,MY,obj_window,windows,false);
    if(size > 0){
        
        var window;
        var window_depth = 1000;
        for (var i = 0; i < size; i++) {
            var window_ = windows[|i];
            if(window_.depth < window_depth){
                window = window_;
                window_depth = window.depth;
            }
        }
        
        window.hover(MX,MY)
    }
    #endregion
    
    global.t++;
    
    #region spawns popup windows
    if(spawn_t > 0){
        spawn_t--;
    } else if(instance_number(obj_window) < max_popups){ //spawn popup when timer reaches 0, and reset timer
        set_spawn_timer()
        
        var window = instance_create_depth(0,0,-(instance_number(obj_window)+10),obj_window);
    }
    #endregion
    
    #region set difficulty dynamically
    
    if(nirvana < 30) global.difficulty = DIFFICULTY.START
    else if (nirvana < 80) global.difficulty = DIFFICULTY.NORMAL
    else global.difficulty = DIFFICULTY.HARD
        
    #endregion
    
    #region gain or drain nirvana depending on amount of windows
    var window_count = instance_number(obj_window);
    
    if(window_count == 0){
        nirvana+= nirvana_gain_spd;
    } else if(window_count == 1){ //less than 2 windows means miniscule gaining
        nirvana += nirvana_gain_spd/2;
    } else if(window_count <= 2) {
        //between 2 and 5 windows, there's no change
    } else {
        nirvana-= nirvana_drain_spd;
    }
    nirvana = clamp(nirvana,0,nirvana_max);
    #endregion

    if(nirvana == nirvana_max){
        winning = true;
    }
}

