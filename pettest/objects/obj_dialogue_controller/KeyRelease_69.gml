if i < array_length(_current_dialogue)
{ 
	if _current_task.dialogue_stage != DialogueStage.POST_COMPLETION {
		_dialogue_string = _current_dialogue[i].text
		_dialogue_string_length = string_length(_dialogue_string)
		_current_speaker = _current_dialogue[i].speaker
		_current_letter = 1
		_current_string = ""
		i++ 
		return; 
	}

} 

global.showing_dialogue = false
_draw = false

i = 0
_current_task.dialogue_stage = min(_current_task.dialogue_stage + 1, DialogueStage.POST_COMPLETION)
switch(_current_task.dialogue_stage) {
	case DialogueStage.INTRO:
		_current_dialogue = _current_task.dialogue.intro
		break
	case DialogueStage.DETAILS:
		_current_dialogue = _current_task.dialogue.details
		break
	case DialogueStage.IN_PROGRESS:
		_current_dialogue = _current_task.dialogue.in_progress
		break
	case DialogueStage.COMPLETED:
		_current_dialogue = _current_task.dialogue.completed
		break
	case DialogueStage.POST_COMPLETION:
	default:
		_current_dialogue = _current_task.dialogue.post_completion
		i = floor(random_range(0, array_length(_current_dialogue)))
		break
}

_dialogue_string = _current_dialogue[i].text
_dialogue_string_length = string_length(_dialogue_string)
_current_speaker = _current_dialogue[i].speaker
_current_letter = 1
_current_string = ""
i++ 

