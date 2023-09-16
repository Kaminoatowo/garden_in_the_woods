extends Node


const eggplant = preload("res://Plants/Eggplant.tscn")
const corn = preload("res://Plants/Corn.tscn")

var plant

func _ready():
	if Game.Curr_plot.size() > 0:
		for i in Game.Curr_plot.size():
			which_plant(i)
			var plant1 = plant.instantiate()
			plant1.plant_num = i
			plant1.load_plant(i)
			add_child(plant1)
			plant1.spawned = true
			plant1.add_plant()
			plant1.dirt = get_node("../DirtContainer").get_child(which_dirt(plant1))
	
	Game.Curr_plot = []

func _on_save_button_pressed():
	for i in get_child_count():
		get_child(i).add_plant()
	Utils.save_game()


func which_plant(plant_num):
	match Game.Curr_plot[plant_num]["Seed"]:
		"Corn":
			plant = corn
		"Eggplant":
			plant = eggplant

func which_dirt(_plant):
	var dirt_num : int
	for i in get_node("../DirtContainer").get_child_count():
		if _plant.position == get_node("../DirtContainer").get_child(i).position:
			dirt_num = _plant.plant_num
	return dirt_num

func reshuffle_plants(num):
	for i in get_child_count():
		if get_child(i).plant_num > num:
			get_child(i).plant_num -= 1
