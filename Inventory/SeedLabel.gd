extends Label
class_name SeedLabel

var is_on : bool = false

func _process(delta):
	if !is_on:
		self.hide()
	else:
		self.show()

func _on_area_2d_mouse_entered():
	if get_parent().texture != null:
		is_on = true
		self.show()
		self.text = get_parent().name_seeds + "\n" + str(get_parent().number_seeds)


func _on_area_2d_mouse_exited():
	if get_parent().texture != null:
		is_on = false
		self.hide()
