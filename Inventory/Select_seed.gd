extends Selector

func _ready():
	
	for child_index in get_child_count():
		if child_index > 0:
			get_child(child_index).get_node("Select").hide()
	
	get_child(1).rename_seed("Corn")
	get_child(1).increase_seed(999)
	
	get_child(2).rename_seed("Eggplant")
	get_child(2).increase_seed(999)
