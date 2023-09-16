extends Node2D
class_name Selector

var selector_show = false
var selected : int = 0
var hide_select : int = 0


func _input(event):
	if get_parent().selector_show == true:
		if event.is_action_pressed("spawn"):
			which_seed_select()

func which_seed_select():
	if get_local_mouse_position().x < 400 and get_local_mouse_position().x > 0:
		if get_local_mouse_position().y < 60 and get_local_mouse_position().x > 0:
			selected = floor((get_local_mouse_position().x - 15) / 37) + 1
			
			if selected != 0:
				if hide_select == 0:
					get_child(selected).get_node("Select").show()
					hide_select = selected
				elif hide_select != selected:
					get_child(hide_select).get_node("Select").hide()
					get_child(selected).get_node("Select").show()
					hide_select = selected
			
				Game.Selected = selected
