extends Node
class_name PlayerStateMachine

@export var character : CharacterBody2D
@export var current_state : PlayerState 

var states : Array[PlayerState]

func _ready():
	for child in get_children():
		if (child is PlayerState):
			states.append(child)
			
			child.character = character
			
		else:
			push_warning("Child " + child.name + " is not a PlayerState for CharacterStateMachine")

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
