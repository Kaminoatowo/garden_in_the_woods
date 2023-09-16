extends Node2D


const eggplant = preload("res://Plants/Eggplant.tscn")
const corn = preload("res://Plants/Corn.tscn")

var plant

func _on_save_button_pressed():
	for i in get_child_count():
		get_child(i).get_child(0).add_plant()
	Utils.save_game()

func _on_reset_button_pressed():
	for i in get_child_count():
		get_child(i).get_child(0).queue_free()

func _on_load_button_pressed():
	Utils.load_game()
	
	if Game.Curr_plot.size() > 0:
		for i in Game.Curr_plot.size():
			which_plant(i)
			var plant1 = plant.instantiate()
			plant1.plant_num = i
			plant1.load_plant(i)
			var child_num = which_child(plant1)
			get_child(child_num).add_child(plant1)
			get_child(child_num).has_seeds = true
			plant1.spawned = true
			plant1.add_plant()
	
	Game.Curr_plot = []


func which_plant(plant_num):
	match Game.Curr_plot[plant_num]["Seed"]:
		"Corn":
			plant = corn
		"Eggplant":
			plant = eggplant

func which_child(plant):
	var child_num : int
	var plant_position = plant.position
	for i in get_child_count():
		if plant_position == get_child(i).position:
			child_num = plant.plant_num
	return child_num
