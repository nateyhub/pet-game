/// @description Turn off app surface drawing

// Inherit the parent event
//event_inherited();
global.current_pal = 2;
application_surface_draw_enable(false);

//control = instance_create_depth(x, y, depth - 1, objPaletteControl).setPal(spr_pope_pal, function(_newValue) {
//  global.current_pal = _newValue;  
//});