extends Label


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var date = Time.get_datetime_dict_from_system()
	self.text = "Time: " + str(date["hour"]) + " : " + str(date["minute"])
	Game.cur_date = str(date["day"]) + "-" + str(date["month"]) + "-" + str(date["year"])
	Game.cur_time = str(date["hour"]) + ":" + str(date["minute"])
