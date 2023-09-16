extends Area2D

var has_seeds = false

const eggplant = preload("res://Plants/Eggplant.tscn")
const corn = preload("res://Plants/Corn.tscn")

var plant

func _on_input_event(viewport, event, shape_idx):
	if has_seeds == false:
		if event.is_action_pressed("spawn"):
			which_plant()
			spawn_plant()
			has_seeds = true

func which_plant():
	match Game.Selected:
		1:
			plant = corn
		2:
			plant = eggplant

func spawn_plant():
	var plant1 = plant.instantiate()
	plant1.position = self.position
	get_parent().get_parent().get_node("Plants").add_child(plant1)
	plant1.add_plant()
	plant1.spawned = true
	plant1.dirt = self

