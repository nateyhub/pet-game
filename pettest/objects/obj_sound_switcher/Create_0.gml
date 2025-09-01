_current_room = room_get_name(room)

show_debug_message("sound_switcher: CURRENT ROOM: " + string(room_get_name(room)))

switch(_current_room) {
	case "rm_home":
		audio_play_sound(bgm_house, 100, true)
		break;
	default:
		audio_play_sound(sfx_city_ambience,100,true,1.2)
		audio_play_sound(sfx_park_ambience,100,true)
		audio_sound_gain(sfx_park_ambience,0,0)
		audio_play_sound(bgm_town, 101,true, .7)
}



