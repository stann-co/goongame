top_size = 10;
side_size = 2;

//if window spawns in the chuds area, it gets pushed out, so you can see his face
chud_safe_width = 100;
chud_safe_height = 75;

taskbar_height = 17;

popup_images = [
    spr_popup_big01,
    spr_popup_big02,
    spr_popup_medium01,
    spr_popup_medium02,
    spr_popup_medium03,
    spr_popup_medium04,
    spr_popup_medium05,
    spr_popup_medium06,
    spr_popup_small01,
    spr_popup_small02,
    spr_popup_small03
]

//select a random popup image
popup_image = popup_images[irandom(array_length(popup_images)-1)];

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
        powerup = false;
        mirrored = false;
    case DIFFICULTY.NORMAL:
        shaking = (chance(10));
        inverted = (chance(12));
        moving = (chance(15));
        waving = (chance(20));
        powerup = chance(20);
        mirrored = chance(10);
    case DIFFICULTY.HARD:
        shaking = (chance(8));
        inverted = (chance(10));
        moving = (chance(10));
        waving = (chance(10));
        powerup = chance(20);
        mirrored = chance(6);
        break;
}

if(powerup){
    shaking = false;
    mirrored = false;
    moving = true;
    inverted = false;
    waving = true;
    popup_image = spr_popup_powerup;
}

subimg = 0;

var w_ = sprite_get_width(popup_image);
var h_ = sprite_get_height(popup_image);

//sets window size based on popup image
image_xscale = (w_ + (side_size*2)) / sprite_get_width(spr_window);
image_yscale = (h_ + side_size + top_size) / sprite_get_height(spr_window);

if(mirrored) {
    image_xscale *= -1;
    x = random_range(abs(sprite_width),global.game_w);
} else {
    x = random_range(0,global.game_w-sprite_width);    
}
    

y = random_range(0,global.game_h-sprite_height-taskbar_height);

//if window is in the chuds safe region, it gets pushed out
if(bbox_right > global.game_w - chud_safe_width && bbox_top < chud_safe_height){
    if(irandom(1) == 1){
        x -= chud_safe_width; //pushes it left
    } else {
        y += chud_safe_height; //or pushes it down
    }
}

close_size = 16; //How big the X buttons collision area is in the top right corner

close_hover = false;
button_hover = false;

hover = function(_x,_y){
    var hovering = false;
    
    if(mirrored){
        if( //if the _x and _y is within the close buttons area
            _x > bbox_left &&
            _x < (bbox_left + close_size) &&
            _y > bbox_top &&
            _y < (bbox_top + close_size)
        ) hovering = true;  
    } else {
        if( //if the _x and _y is within the close buttons area
            _x < bbox_right &&
            _x > (bbox_right - close_size) &&
            _y > bbox_top &&
            _y < (bbox_top + close_size)
        ) hovering = true;  
    }
    
    if(hovering){
        close_hover = true;
        if (mouse_check_button_pressed(mb_left)){
            instance_destroy();
            part_particles_create(global.particles,MX,MY,global.part_stars,4);
        }
    }
}