extends Node
class_name PlantStateMachine

@export var plant : Area2D
@export var current_state : PlantState 

var states : Array[PlantState]

func _ready():
	for child in get_children():
		if (child is PlantState):
			states.append(child)
			
			child.plant = plant
			print(plant)
			
		else:
			push_warning("Child " + child.name + " is not a PlantState for plantStateMachine")

func _physics_process(delta):
	if (current_state.next_state != null):
		switch_states(current_state.next_state)
		
	current_state.state_process(delta)
	
func switch_states(new_state):
	if (current_state != null):
		current_state.on_exit()
		current_state.next_state = null
	
	current_state = new_state
	current_state.on_enter()
