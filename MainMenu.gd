extends Node2D

func _ready():
	Utils.load_game()
	#Utils.save_game()
	print("Last save was \n" + Game.cur_date + " at " + Game.cur_time)
#	print(Game.Harvests)

func _on_button_pressed():
	get_tree().change_scene_to_file("res://World/World.tscn")
