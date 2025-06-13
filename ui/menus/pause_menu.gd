extends Control


func _on_continue_pressed():
	hide()
	
func _on_options_pressed():
	Global.gameControler.showOptionsMenu()

func _on_exit_pressed():
	SaveManager.save_game()
	get_tree().quit()
