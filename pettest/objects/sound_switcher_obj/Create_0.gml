_current_room = room_get_name(room)

show_debug_message("sound_switcher: CURRENT ROOM: " + string(room_get_name(room)))

switch(_current_room) {
	case "GameRoom":
		audio_play_sound(house_music, 100, true)
		break;
	default:
		audio_play_sound(city_ambience,100,true,1.2)
		audio_play_sound(park_ambience,100,true)
		audio_sound_gain(park_ambience,0,0)
		audio_play_sound(town_music, 101,true, .7)
}



