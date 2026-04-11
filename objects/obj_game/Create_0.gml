stanncam_init(480,270,1920,1080,,,STANNCAM_WINDOW_MODE.FULLSCREEN);
global.camera = new stanncam(global.game_w/2, global.game_h/2);


max_popups = 20;

timer_min = 0.2;
timer_max = 1;

spawn_t = GAME_SPEED * 2;

taskbar_height = 17;

chud_width = 140;
chud_height = 93;

//if window spawns in the chuds area, it gets pushed out, so you can see his face
chud_safe_width = 100;
chud_safe_height = 75;

nirvana = 0;
nirvana_max = 100;
nirvana_gain_spd = 0.05;
nirvana_drain_spd = 0.03;

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
    spr_sexy2
]

//sexy videos cycles through
sexy_video_index = 0;
sexy_video = sexy_videos[sexy_video_index];
sexy_video_t = 0;

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