//mouse cursor checks for collisions and input with windows and buttons

#region mouse click
if (mouse_check_button_pressed(mb_left)){
    show_debug_message("click")
    
    var windows = ds_list_create();
    var size = instance_position_list(MX,MY,obj_window,windows,true);
    if(size > 0){
        var window = windows[|size-1];
        show_debug_message("found A window")
        if(window.close(MX,MY) == true){
            //if the window succesfully closed
        } else {
            
        }
    }
}
#endregion

global.t++;

#region spawns popup windows


#endregion



