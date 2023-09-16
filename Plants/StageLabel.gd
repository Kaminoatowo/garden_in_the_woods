extends Label

@export var plant : Plant

func _process(delta):
	var frame = plant.stage
	self.text = "Frame: " + str(frame)
