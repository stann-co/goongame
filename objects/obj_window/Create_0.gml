top_size = 10;
side_size = 2;

width_min = 100;
height_min = 60;

width_max = 200;
height_max = 200;

//sets random window size
image_xscale = random_range(width_min,width_max) / sprite_width;
image_yscale = random_range(height_min,height_max) / sprite_height;



close_size = 16; //How big the X buttons collision area is in the top right corner
close_hover = function(_x,_y){
    if( //if the _x and _y is within the close buttons area
        _x < bbox_right &&
        _x > (bbox_right - close_size) &&
        _y > bbox_top &&
        _y < (bbox_top + close_size)
    ) {
        return true;
    }
    return false;
}