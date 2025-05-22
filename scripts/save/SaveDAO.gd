class_name SaveDAO
extends Object



func _read_save(save : Save) -> Save:
	if FileAccess.file_exists(SaveManager.get_save_path(save.slot)):
		var file = FileAccess.open_encrypted_with_pass(SaveManager.get_save_path(save.slot),FileAccess.READ, SaveManager.PASSWORD)
		
		if file.get_error() == OK:
			var data = file.get_as_text()
			file.close()
			return Save.from_dictionary(JSON.parse_string(data))
		else:
			printerr("Could not open the file %s. Error code: %s" % [SaveManager.get_save_path(save.slot),file.get_error()])
			return null
	printerr("Could not open the file %s. File doesn't exist" % SaveManager.get_save_path(save.slot))
	return null

func _write_save(save : Save) -> bool:
	var file = FileAccess.open_encrypted_with_pass(SaveManager.get_save_path(save.slot),FileAccess.WRITE, SaveManager.PASSWORD)
	
	if file.get_error() == OK:
		file.store_string(JSON.stringify(Save.to_dictionary(save).duplicate(true)))
		file.close()
		return true
	
	printerr("Could not open the file %s. Error code: %s" % [SaveManager.get_save_path(save.slot),file.get_error()])
	return false

func _delete_save(save : Save) -> bool:
	var dir = DirAccess.open(SaveManager.get_save_dir_path())
	
	if dir:
		var error = dir.remove(SaveManager.get_save_file_path(save.slot))
		
		if error == OK:
			return true
	
	printerr("Could not delete the file %s. Directiory doesn't exist" % [SaveManager.get_save_path(save.slot)])
	return false
