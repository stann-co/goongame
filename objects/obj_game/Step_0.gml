//mouse cursor checks for collisions and input with windows and buttons

#region mouse click
if (mouse_check_button_pressed(mb_left)){
    show_debug_message("click")
    
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
        
        if(window.close(MX,MY) == true){
            show_debug_message("sucessfully closed!")
            //if the window succesfully closed
            spawn_t = timer_max*GAME_SPEED; //if you close a window reset timer again
        } else {
            
        }
    }
}
#endregion

#region spawns popup windows
if(spawn_t > 0){
    spawn_t--;
} else if(instance_number(obj_window) < max_popups){ //spawn popup when timer reaches 0, and reset timer
    spawn_t = random_range(timer_min*GAME_SPEED,timer_max*GAME_SPEED);
    
    var window = instance_create_depth(0,0,-instance_number(obj_window),obj_window);
    
    window.x = random_range(0,global.game_w-window.sprite_width);
    window.y = random_range(0,global.game_h-window.sprite_height-taskbar_height);
    
    
}

#endregion



