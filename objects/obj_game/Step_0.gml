//mouse cursor checks for collisions and input with windows and buttons

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
            spawn_t = timer_max*GAME_SPEED; //if you close a window reset timer again
            instance_destroy(window);
            global.hovered = noone;
        } else {
            
        }   
    } else global.hovered = noone;
} else global.hovered = noone;
#endregion

#region spawns popup windows
if(spawn_t > 0){
    spawn_t--;
} else if(instance_number(obj_window) < max_popups){ //spawn popup when timer reaches 0, and reset timer
    spawn_t = random_range(timer_min*GAME_SPEED,timer_max*GAME_SPEED);
    
    var window = instance_create_depth(0,0,-(instance_number(obj_window)+10),obj_window);
    
    window.x = random_range(0,global.game_w-window.sprite_width);
    window.y = random_range(0,global.game_h-window.sprite_height-taskbar_height);
    
    //if window is in the chuds safe region, it gets pushed out
    if(window.bbox_right > global.game_w - chud_safe_width && window.bbox_top < chud_safe_height){
        window.x -= chud_safe_width; //pushes it left
    }
}
#endregion

#region gain or drain nirvana depending on amount of windows
var window_count = instance_number(obj_window);

if(window_count > 0){
    if(nirvana > 0) nirvana-= nirvana_drain_spd;
} else {
    if(nirvana < nirvana_max){
        nirvana += nirvana_gain_spd;
    }
}
#endregion


