extends Selector

# dictionary of icons of crops which can be harvested
var harvestable = {
	"Corn" : "res://Sprout Lands - Sprites - Basic pack/Objects/Harvests/Corn Harvest.png",
	"Eggplant" : "res://Sprout Lands - Sprites - Basic pack/Objects/Harvests/Eggplant Harvest.png"
}

# when a crop is harvested, save the harvest to the inventory
var harvested = []

var max_harvested = 0

func _ready():
	if Game.Harvests.size() > 0:
		for item in Game.Harvests:
			add_new(item.Name, item.Count)
	
	for child_index in get_child_count():
		if child_index > 0:
			get_child(child_index).get_node("Select").hide()


func store_crop(_plant : Plant):
	var _new_harvest = _plant.fruit_name
	if harvested.size() == 0:
		add_new(_new_harvest, _plant.fruit_number)
	else:
		var is_there = false
		for _harvest in harvested:
			if _new_harvest == _harvest.Harvest:
				is_there = true
				_harvest.Collected += _plant.fruit_number
				get_child(_harvest.Basket).number_collected += _plant.fruit_number
		if !is_there:
			add_new(_new_harvest)

func add_new(_name, _count = 1):
	max_harvested += 1
	harvested.append({
			"Harvest" : _name, 
			"Collected" : _count,
			"Basket" : max_harvested
			})
	get_child(max_harvested).texture = load(harvestable[_name])
	get_child(max_harvested).number_collected += _count
	get_child(max_harvested).rename_collected(_name)
