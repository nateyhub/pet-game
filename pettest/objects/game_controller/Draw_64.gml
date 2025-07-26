function drawNeed(x_start, y_start, x_end, y_end, need, needName) {
	// draw the name of the need (eg "Hunger")
	draw_text(x_start+10,y_start+4,needName + ":" + string(need))
	//draw box outline to wrap around text
	draw_rectangle(x_start,y_start,x_end,y_end,true)
	//draw status bar
	draw_rectangle(x_start+150,y_start,(x_end + 20) + (2*need), y_end,false)
}

//hunger box
drawNeed(10,10,140,40,dog_obj.hunger, "Hunger")

//hygiene box
drawNeed(10,50,140,80,dog_obj.hygiene, "Hygiene")

//energy box
drawNeed(10,90,140,120,dog_obj.energy, "Energy")

//COLUMN 2
//bladder
drawNeed(470,10,600,40,dog_obj.bladder, "Bladder")

//fun
drawNeed(470,50,600,80,dog_obj.fun, "Fun")

//health
drawNeed(470,90,600,120,dog_obj.health, "Health")

draw_sprite(heart_spr, image_index, 12, 12)
