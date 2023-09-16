extends PlayerState
class_name RunState

@export var idle_state : PlayerState

func state_process(delta):
	play_animation(Input)
	move_character(Input, SPEED * delta)


func play_animation(event):
	if event.is_action_pressed("ui_down"):
		animation.play("WalkDown")
	elif event.is_action_pressed("ui_up"):
		animation.play("WalkUp")
	elif event.is_action_pressed("ui_left"):
		animation.play("WalkLeft")
	elif event.is_action_pressed("ui_right"):
		animation.play("WalkRight")
	else:
		next_state = idle_state

func move_character(event, step):
	if event.is_action_pressed("ui_down"):
		character.position.y += step
	elif event.is_action_pressed("ui_up"):
		character.position.y -= step
	elif event.is_action_pressed("ui_left"):
		character.position.x -= step
	elif event.is_action_pressed("ui_right"):
		character.position.x += step
