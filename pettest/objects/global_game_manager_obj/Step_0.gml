// set critical to true if any of the pet's needs are empty
global.needs_critical = (global.pet_needs.hunger.value < 1
|| global.pet_needs.energy.value < 1
|| global.pet_needs.bladder.value < 1
|| global.pet_needs.fun.value < 1
|| global.pet_needs.hygiene.value < 1
)