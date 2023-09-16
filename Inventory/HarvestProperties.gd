extends Sprite2D
class_name HarvestProperties

var number_collected : int = 0
var name_collected

func increase_collected(num):
	if self.texture != null:
		number_collected = num

func rename_collected(_name):
	if self.texture != null:
		name_collected = _name
