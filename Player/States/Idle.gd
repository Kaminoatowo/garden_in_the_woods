extends PlayerState
class_name IdleState

@export var run_state : PlayerState

func state_process(delta):
	play_animation()
	
	if Input.is_action_pressed("ui_down"):
		next_state = run_state
		body_direction = "down"
	elif Input.is_action_pressed("ui_up"):
		next_state = run_state
		body_direction = "up"
	elif Input.is_action_pressed("ui_left"):
		next_state = run_state
		body_direction = "left"
	elif Input.is_action_pressed("ui_right"):
		next_state = run_state
		body_direction = "right"
		
	pass


func play_animation():
	if body_direction == "down":
		animation.play("IdleDown")
	elif body_direction == "up":
		animation.play("IdleUp")
	elif body_direction == "left":
		animation.play("IdleLeft")
	elif body_direction == "right":
		animation.play("IdleRight")
