extends Node
class_name PlayerState

@export var animation : AnimationPlayer

var character
var body_direction : String = "down"
var SPEED : float = 200.0
var next_state : PlayerState = null

func state_process(delta):
	pass
	
func state_input(event : Input):
	pass

func on_enter():
	pass

func on_exit():
	next_state.body_direction = body_direction
