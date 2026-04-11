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
nirvana_gain_spd = 1;
nirvana_drain_spd = 0.5;