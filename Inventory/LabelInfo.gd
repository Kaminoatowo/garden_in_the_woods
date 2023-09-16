extends HarvestLabel

func _process(delta):
	if !is_on:
		self.hide()

