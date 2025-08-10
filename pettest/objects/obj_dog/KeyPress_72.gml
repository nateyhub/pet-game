show_debug_message("Hunger: " + string(hunger))
hunger--
if hunger == 50 {
	show_debug_message("Hunger is good!")
} else {
	show_debug_message("HUNGER is bad, you suck")
}