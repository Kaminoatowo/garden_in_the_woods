extends Area2D
class_name Plant

@export var timer : Timer
@export var plant : Sprite2D

@export var max_stage : int
@export var min_stage : int = 0
@export var grow_time : float = 1.0
@export var plant_name : String
@export var fruit_name : String = plant_name

var stage : int = min_stage + 1
var plant_num : int
var spawned : bool = false
var dirt : Area2D
var dirt_num : int
var can_harvest : bool = false
var fruit_number : int
var fruit

func _ready():
	plant_num = Game.Plot.size()
	
	timer.start()
	timer.wait_time = grow_time
	timer.timeout.connect(_on_timer_timeout)
	
	plant.frame = stage
	
#	self.connect("body_entered", _on_body_entered)

func _process(delta):
	if spawned == true:
		Game.Plot[plant_num]["TimeLeft"] = timer.time_left


func _on_timer_timeout():
	if spawned == true:
		if stage < max_stage - 1:
			stage += 1
			plant.frame = stage
			Game.Plot[plant_num]["Stage"] = stage
			timer.wait_time = grow_time
		elif stage == max_stage - 1:
			can_harvest = true
			var rng = RandomNumberGenerator.new()
			fruit_number = 3 + rng.randi_range(-1, 1)


func create_fruit_data():
	var fruit_dictionary = {
		"Name": fruit_name,
		"Count": fruit_number,
		"Consumable": true,
	}
	return fruit_dictionary

func create_plant_data():
	var plant_dictionary = {
		"Seed": plant_name,
		"TimeLeft": timer.time_left,
		"Stage": stage,
		"Position": self.position,
	}
	return plant_dictionary


func add_plant():
	var plant_added = false
	for i in Game.Plot.size():
		if self.position == Game.Plot[i].Position:
			Game.Plot[i]["TimeLeft"] = create_plant_data().TimeLeft
			Game.Plot[i]["Stage"] = create_plant_data().Stage
			plant_added = true
	if !plant_added:
		Game.Plot.append(create_plant_data())
#	dirt = get_parent().get_parent().get_node("DirtContainer").get_child(dirt_num)

func load_plant(num):
	name = Game.Curr_plot[num].Seed
	stage = Game.Curr_plot[num].Stage
	self.position = Game.Curr_plot[num].Position
	timer.wait_time = Game.Curr_plot[num].TimeLeft

func add_fruit():
	var fruit_added = false
	if Game.Harvests.size() == 0:
		Game.Harvests.append(create_fruit_data())
	else:
		for i in Game.Harvests.size():
			if fruit_name == Game.Harvests[i].Name:
				Game.Harvests[i]["Count"] += fruit_number
				fruit_added = true
		if !fruit_added:
			Game.Harvests.append(create_fruit_data())
	get_parent().get_parent().get_node("UI/HarvestInventory/Select Harvest").store_crop(self)
#	print(get_parent().get_parent().get_node("UI/HarvestInventory/Select Harvest").get_path())
	remove_fruit()


func welcome_body(body):
	if body.name == "Player":
		if can_harvest:
			add_fruit()
#			print(Game.Harvests)


func remove_fruit():
	dirt.has_seeds = false
	Game.Plot.pop_at(plant_num)
	get_node("../").reshuffle_plants(plant_num)
	self.queue_free()
