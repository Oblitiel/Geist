extends Node

const SAVE_DIR_PATH : String = "user://"
const SAVE_FILE_PATH : String = "saveSlot%d.save"
const PASSWORD : String = "0akvj38h1n639n"

var current_game_state : Save = Global.DEFAOULT_SAVE_DATA
var save_dao : SaveDAO = SaveDAO.new()

#func _ready() -> void:
	#current_game_state = Save.new(1,"level",[])
	#save_game()

func save_exists(slot : int) -> bool:
	return FileAccess.file_exists(SaveManager.get_save_path(slot))

func get_save_path(slot : int):
	return get_save_dir_path() + get_save_file_path(slot)

func get_save_file_path(slot : int):
	return SAVE_FILE_PATH % slot

func get_save_dir_path():
	return SAVE_DIR_PATH

func save_game() -> bool:
	return save_dao._write_save(current_game_state)

func load_game() -> bool:
	var new_state = save_dao._read_save(current_game_state)
	
	if new_state:
		current_game_state = new_state
		#TODO Cargar los datos y tal
		Global.gameControler.changeScene(current_game_state.level)
		
		return true
	
	return false

func reset_game_file() -> bool:
	current_game_state = Global.DEFAOULT_SAVE_DATA
	return save_game() and load_game()
