//hunger box
draw_rectangle(10,10,140,40,true)
//hunger bar
draw_rectangle(160,10,160 + (2*dog_obj.hunger),40,false)
//hunger string
draw_text(20,14,"Hunger:" + string(dog_obj.hunger))


//hygiene box
draw_rectangle(10,50,140,80,true)
//hygiene bar
draw_rectangle(160,50, 160 + (2*dog_obj.hygiene),80,false)
//hygiene string
draw_text(20,54,"Hygiene:" + string(dog_obj.hygiene))

//energy box
draw_rectangle(10,90,140,120,true)
//energy bar
draw_rectangle(160,90, 160 + (2*dog_obj.energy),120,false)
//energy  string
draw_text(20,94,"Energy:" + string(dog_obj.energy))

//hunger box
draw_rectangle(470,10,600,40,true)
//hunger bar
draw_rectangle(620,10,620 + (2*dog_obj.bladder),40,false)
//hunger string
draw_text(480,14,"Bladder:" + string(dog_obj.bladder))

