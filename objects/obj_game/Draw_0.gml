//draw sexy video
draw_sprite(sexy_video,sexy_video_t,global.game_w/2,global.game_h/2);
sexy_video_t += sprite_get_speed(sexy_video) / GAME_SPEED;
if(sexy_video_t > sprite_get_number(sexy_video)){ 
    sexy_video_t = 0;
    sexy_video_index++
    //cycles through sexy videos
    if (sexy_video_index == array_length(sexy_videos)){
        sexy_video_index = 0;
    }
    sexy_video = sexy_videos[sexy_video_index];
} 


draw_sprite(spr_chud_angry,0,global.game_w,0);