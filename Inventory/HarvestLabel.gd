extends Label
class_name HarvestLabel

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
		self.text = get_parent().name_collected + "\n" + str(get_parent().number_collected)


func _on_area_2d_mouse_exited():
	if get_parent().texture != null:
		is_on = false
		self.hide()
