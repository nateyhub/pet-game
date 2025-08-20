// set critical to true if any of the pet's needs are empty
global.needs_critical = (global.pet_needs.hunger.value < 1
|| global.pet_needs.energy.value < 1
|| global.pet_needs.bladder.value < 1
|| global.pet_needs.fun.value < 1
|| global.pet_needs.hygiene.value < 1
)

//part_system_position(global._ps, obj_dog.x-32, obj_dog.y);