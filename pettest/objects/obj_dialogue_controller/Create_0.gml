_draw = false

x_padding = 300
x_string_padding = 20
y_padding = 190

_current_task = global.tasks.lost_cat
_current_task_status = _current_task.status
_current_dialogue = _current_task.dialogue.intro



_dialogue_string = _current_dialogue[0].text
_dialogue_string_length = string_length(_dialogue_string)
_current_speaker = _current_dialogue[0].speaker
_current_letter = 1
_current_string = ""

i = 1





_dialogue_container_x = 400
_dialogue_container_y = display_get_gui_height()-200
_dialogue_container_width = display_get_gui_width() - (x_padding*2)

str_width = _dialogue_container_width