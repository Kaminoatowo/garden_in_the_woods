extends Sprite2D
class_name SelectBag


var is_selected : bool = false


func _on_area_2d_mouse_entered():
	is_selected = true
	
