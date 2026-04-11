top_size = 10;
side_size = 2;

popup_images = [
    spr_popup_big01,
    spr_popup_medium01,
    spr_popup_medium02,
    spr_popup_medium03,
    spr_popup_small01
]

shake_x = 0;
shake_y = 0;
wave_x = 0;
wave_y = 0;
moving_up = irandom(1);
moving_right = irandom(1);

switch (global.difficulty) {
    case DIFFICULTY.START:
        shaking = false;
        inverted = false;
        moving = false;
        waving = false;
    case DIFFICULTY.NORMAL:
        shaking = (chance(10));
        inverted = (chance(12));
        moving = (chance(15));
        waving = (chance(20));
    case DIFFICULTY.HARD:
        shaking = (chance(8));
        inverted = (chance(10));
        moving = (chance(10));
        waving = (chance(10));
        break;
	
}

//select a random popup image
popup_image = popup_images[irandom(array_length(popup_images)-1)];

var w_ = sprite_get_width(popup_image);
var h_ = sprite_get_height(popup_image);

//sets window size based on popup image
image_xscale = (w_ + (side_size*2)) / sprite_get_width(spr_window);
image_yscale = (h_ + side_size + top_size) / sprite_get_height(spr_window);


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