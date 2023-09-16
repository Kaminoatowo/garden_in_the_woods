extends Button




func _on_pressed():
	Utils.save_game()
	get_tree().quit()
