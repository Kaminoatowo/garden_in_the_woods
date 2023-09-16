extends Button
class_name InventoryButton

@export var selector : Selector

var selector_show = false


func _ready():
	selector.hide()
	selector.selector_show = false


func _process(delta):
	if selector_show == true:
		selector.show()
		selector.selector_show = true
	else:
		selector.hide()
		selector.selector_show = false


func _on_pressed():
	selector_show = !selector_show
