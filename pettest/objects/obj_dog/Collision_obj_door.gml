if(keyboard_check_released(vk_space)) {
	audio_stop_all()
	audio_play_sound(sfx_door,100,false,2 )
	global.tipsContainer.clearAllTips()
	room = rm_preset_paths_test
}