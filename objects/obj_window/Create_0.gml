top_size = 5;
side_size = 1;



close_size = 8; //How big the X buttons collision area is in the top right corner
close = function(_x,_y){
    show_debug_message("try to close?!")
    show_debug_message(_x < bbox_right)
    show_debug_message(_x > (bbox_right - close_size))
    show_debug_message(_y > bbox_top)
    show_debug_message(_y < (bbox_top + close_size))
    if( //if the _x and _y is within the close buttons area
        _x < bbox_right &&
        _x > (bbox_right - close_size) &&
        _y > bbox_top &&
        _y < (bbox_top + close_size)
    ) {
        instance_destroy();
    }
}