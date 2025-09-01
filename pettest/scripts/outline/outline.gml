function showObjectOutline(_obj_index){
	layer_add_instance("glow_layer", _obj_index)
}

function hideObjectOutline(_obj_index, _original_layer) {
	layer_add_instance(_original_layer, _obj_index)
}