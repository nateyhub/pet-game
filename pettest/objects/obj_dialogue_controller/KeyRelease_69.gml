//show_debug_message("E pressed")
if array_length(_current_choices) > 0 return;

if _i < array_length(_current_dialogue)
{ 
	if _current_task.dialogue_stage != DialogueStage.POST_COMPLETION {
		_dialogue_string = _current_dialogue[_i].text
		_dialogue_string_length = string_length(_dialogue_string)
		_current_speaker = _current_dialogue[_i].speaker
		_current_letter = 1
		_current_string = ""
		if struct_exists(_current_dialogue[_i], "choices") { 
			_current_choices = struct_get(_current_dialogue[_i], "choices");
		}
		_i++ 
		return; 
	}

} 

_current_choices = []

if _current_task.dialogue_stage != DialogueStage.INTRO {
	global.showing_dialogue = false
}


_current_task.dialogue_stage = min(_current_task.dialogue_stage + 1, DialogueStage.POST_COMPLETION)
switch(_current_task.dialogue_stage) {
	case DialogueStage.INTRO:
		_current_dialogue = _current_task.dialogue.intro
		_i = 0
		break
	case DialogueStage.DETAILS:
		_current_dialogue = _current_task.dialogue.details
		_i = 0
		break
	case DialogueStage.IN_PROGRESS:
		_current_dialogue = _current_task.dialogue.in_progress
		_i = 0
		break
	case DialogueStage.COMPLETED:
		_current_dialogue = _current_task.dialogue.completed
		_i = 0
		break
	case DialogueStage.POST_COMPLETION:
	default:
		show_debug_message("Post completion/default")
		_current_dialogue = _current_task.dialogue.post_completion
		_random_dialogue = floor(random_range(0, array_length(_current_dialogue)))
		show_debug_message("_i: {0} | random: {1}", _i, _random_dialogue)
		while (_random_dialogue == _i) {
			_random_dialogue = floor(random_range(0, array_length(_current_dialogue)))
			show_debug_message("Finding new random: {0}", _random_dialogue)
		}
		_i = _random_dialogue
		break
}

_dialogue_string = _current_dialogue[_i].text
_dialogue_string_length = string_length(_dialogue_string)
_current_speaker = _current_dialogue[_i].speaker
_current_letter = 1
_current_string = ""

if _current_task.dialogue_stage != DialogueStage.POST_COMPLETION _i++;

