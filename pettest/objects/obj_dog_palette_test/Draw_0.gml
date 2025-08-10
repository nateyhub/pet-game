/// @description
//var _w = sprite_get_width(spr_pixelated_pope)
//var _h = sprite_get_height(spr_pixelated_pope)
//for(var _x = 0; _x <= VIEW_W + _w; _x += _w) {
//  for(var _y = 0; _y <= VIEW_H + _h; _y += _h) {
    //draw_sprite(spr_dog, image_index, x, y)
	draw_sprite_ext(spr_dog_walk,image_index,x,y,image_xscale,image_yscale,0,c_white,1)
  //}
//}