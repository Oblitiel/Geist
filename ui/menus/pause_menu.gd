extends Control


func _on_continue_pressed():
	hide_menu()
	
func _on_options_pressed():
	Global.gameControler.showOptionsMenu()

func _on_exit_pressed():
	SaveManager.save_game()
	get_tree().quit()

func show_menu():
	show()
	Global.gameControler.pauseGame()

func hide_menu():
	hide()
	Global.gameControler.runGame()

func toggle_menu():
	if visible:
		hide_menu()
	else:
		show_menu()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("back"):
		toggle_menu()


func _on_reset_pressed() -> void:
	Global.gameControler.continueGame()
	hide_menu()
