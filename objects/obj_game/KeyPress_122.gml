if(window_get_fullscreen()){
    stanncam_set_resolution(1920/2,1080/2);
    stanncam_set_windowed();   
} else {
    stanncam_set_resolution(1920,1080);
    stanncam_set_fullscreen();
}
