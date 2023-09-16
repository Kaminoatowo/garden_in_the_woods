extends Node2D
class_name Selector_backup
#class_name Selector

@export var min_select : int

var selector_show = false
var max_select : int

func _ready():
	Game.Selected = min_select
	if min_select > 0:
		hide_all()

func _input(event):
	if selector_show == true:
		if event.is_action_pressed("select_up"):
			if Game.Selected < max_select:
				Game.Selected += 1
		if event.is_action_pressed("select_down"):
			if Game.Selected > min_select:
				Game.Selected -= 1

func _process(delta):
	max_select = get_child_count() - 1
	show_select()

func show_select():
	hide_all()
	if Game.Selected <= max_select:
		get_child(Game.Selected).show()
	else: 
		pass

func hide_all():
	if Game.Selected > 0:
		for i in get_child_count():
			if get_child(i).name != "InventoryBar":
				get_child(i).hide()
