show_debug_message("Q pressed")
_draw = false
global.showing_dialogue = false
_current_letter = 1
_current_string = ""

_dialogue_string = _current_dialogue[0].text
_current_speaker = _current_dialogue[0].speaker
_dialogue_string_length = string_length(_dialogue_string)
i = 1