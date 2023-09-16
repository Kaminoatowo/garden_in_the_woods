extends Sprite2D
class_name SeedProperties


var number_seeds : int = 0
var name_seeds


func increase_seed(num):
	if self.texture != null:
		number_seeds = num

func rename_seed(_name):
	if self.texture != null:
		name_seeds = _name
