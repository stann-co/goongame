if (os_type != os_windows){
    stanncam_init(480,270,1920*0.75,1080*0.75,,,STANNCAM_WINDOW_MODE.FULLSCREEN);
} else {
    stanncam_init(480,270,1920,1080,,,STANNCAM_WINDOW_MODE.FULLSCREEN);    
}
stanncam_set_keep_aspect_ratio(false);


global.camera = new stanncam(global.game_w/2, global.game_h/2);


max_popups = 20;

spawn_t = GAME_SPEED * 2;

taskbar_height = 17;

chud_width = 140;
chud_height = 93;

nirvana = 0;
nirvana_max = 100;
nirvana_gain_spd = 0.02;
nirvana_drain_spd = 0.015;

enum NIRVANA_GAINING{
    SUPER_GAIN,
    GAIN,
    SLIGHT_GAIN,
    NO_GAIN,
    DRAIN,
    SUPER_DRAIN
}
nirvana_gaining = NIRVANA_GAINING.NO_GAIN; //wether going up or down


sexy_videos = [
    spr_sexy1,
    spr_sexy2,
    spr_sexy3,
    spr_sexy4
]

sexy_bgs = [
    spr_sexy_bg1,
    spr_sexy_bg2,
    spr_sexy_bg3
]

//sexy videos cycles through
sexy_bg_index = 0;
sexy_bg = sexy_bgs[sexy_bg_index];
sexy_video_index = 0;
sexy_video = spr_sexy_buffer;
sexy_video_t = 0;
sexy_fps = 10;

chud_states = [
    spr_chud01,
    spr_chud02,
    spr_chud03,
    spr_chud04,
    spr_chud05
]
chud_index = 0;

//particles
layer_create(-1000,"particles");
global.particles = part_system_create_layer("particles", true);

set_spawn_timer = function(){
    switch (global.difficulty) {
        case DIFFICULTY.START:
            max_popups = 4;
            spawn_t = random_range(1*GAME_SPEED,2*GAME_SPEED);
            break
        case DIFFICULTY.NORMAL:
            max_popups = 6;
            spawn_t = random_range(0.5*GAME_SPEED,1.5*GAME_SPEED);
            break
        case DIFFICULTY.HARD:
            max_popups = 9;
            spawn_t = random_range(0.4*GAME_SPEED,1.4*GAME_SPEED);
            break
    	
    }
}

winning = false;
winning_t = 0;
winning_duration = GAME_SPEED*2;

win = function(){
    show_debug_message("win!")
    global.state = STATE.WIN;
    global.completion_time = global.t;
    instance_destroy(obj_window); //destroy all windows
}

start_game = function(){
    
    winning = false;
    winning_t = 0;
    nirvana = 0;
    global.state = STATE.GAME;
    global.t = 0;
    instance_destroy(obj_window); //destroy all windows
    sexy_video = spr_sexy_buffer;
    sexy_video_t = 0;
    sexy_fps = 10;
}
