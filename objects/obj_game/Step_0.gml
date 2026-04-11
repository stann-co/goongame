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
        
        if(window.close_hover(MX,MY)){
            global.hovered = window;
            if (mouse_check_button_pressed(mb_left)){
                //if the window succesfully closed
                //set_spawn_timer(GAME_SPEED*2);
                
                instance_destroy(window);
                part_particles_create(global.particles,MX,MY,global.part_stars,4);
                global.hovered = noone;
            } else {
                
            }   
        } else global.hovered = noone;
    } else global.hovered = noone;
    #endregion
    
    global.t++;
    
    #region spawns popup windows
    if(spawn_t > 0){
        spawn_t--;
    } else if(instance_number(obj_window) < max_popups){ //spawn popup when timer reaches 0, and reset timer
        set_spawn_timer()
        
        var window = instance_create_depth(0,0,-(instance_number(obj_window)+10),obj_window);
        
        window.x = random_range(0,global.game_w-window.sprite_width);
        window.y = random_range(0,global.game_h-window.sprite_height-taskbar_height);
        
        //if window is in the chuds safe region, it gets pushed out
        if(window.bbox_right > global.game_w - chud_safe_width && window.bbox_top < chud_safe_height){
            if(irandom(1) == 1){
                window.x -= chud_safe_width; //pushes it left
            } else {
                window.y += chud_safe_height; //or pushes it down
            }
            
        }
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
}

