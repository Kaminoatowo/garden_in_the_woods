extends Node

#const SAVE_PATH : String = "user://savegame.txt"
#const SAVE_PASS : String = "password"

var save_folder = "user://saves"

var save_path : Array[String] = [
	"date.txt", 
	"time.txt",
	"player.txt",
	"plants.bin",
	"fruits.bin"
	]

func save_game():
	
	save_string(save_path[0], Game.cur_date)
	save_string(save_path[1], Game.cur_time)
	save_var(save_path[2], Game.Player)
	save_var(save_path[3], Game.Plot)
	save_var(save_path[4], Game.Harvests)
	print("Last save was \n" + Game.cur_date + " at " + Game.cur_time)

func load_game():
	
	Game.cur_date = load_string(save_path[0])
	Game.cur_time = load_string(save_path[1])
	Game.Player = load_var(save_path[2])
	Game.Curr_plot = load_var(save_path[3])
	Game.Harvests = load_var(save_path[4])


func save_string(path, content):
	if !DirAccess.dir_exists_absolute(save_folder):
		DirAccess.make_dir_absolute(save_folder)
	var save_file_name = save_folder + "/save" + path
	print(save_file_name)
	var file = FileAccess.open(save_file_name, FileAccess.WRITE)
	file.store_string(content)

func load_string(path):
	var load_file_name = save_folder + "/save" + path
	var last_save_file = save_folder + "/lastsave" + path
	if FileAccess.file_exists(load_file_name):
		var file = FileAccess.open(load_file_name, FileAccess.READ)
		DirAccess.rename_absolute(load_file_name, last_save_file)
		return file.get_as_text()
	else: 
		print("file not found")
		save_game()
		return load_string(path)


func save_var(path, content):
	if !DirAccess.dir_exists_absolute(save_folder):
		DirAccess.make_dir_absolute(save_folder)
	var save_file_name = save_folder + "/save" + path
	var file = FileAccess.open(save_file_name, FileAccess.WRITE)
	file.store_var(content)
	
func load_var(path):
	var load_file_name = save_folder + "/save" + path
	var last_save_file = save_folder + "/lastsave" + path
	if FileAccess.file_exists(load_file_name):
		var file = FileAccess.open(load_file_name, FileAccess.READ)
		DirAccess.rename_absolute(load_file_name, last_save_file)
		
		return file.get_var()
	else: 
		print("file not found")
		save_game()
		return load_var(path)
