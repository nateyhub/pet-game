function plan() {
	target_x = argument0
	target_y = argument1
	
	mp_grid_path(global.grid, path, x, y, target_x, target_y, true)
	path_start(path, 4, path_action_stop, true)
}