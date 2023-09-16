extends CharacterBody2D

@onready var state_machine : PlayerStateMachine = $StateMachine

func _ready():
	if Game.Player["Position"] != null:
		self.position = Game.Player.Position
	else:
		pass
	
func _process(delta):
	move_and_slide()

func _on_save_and_exit_pressed():
	Game.Player["Position"] = self.position
