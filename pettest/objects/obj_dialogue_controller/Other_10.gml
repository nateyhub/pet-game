_draw = true
global.showing_dialogue = true
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