extends Control

func _on_exit_button_pressed():
	if visible:
		hide_menu()

func _on_option_button_item_selected(index):
	if index == 0:
		TranslationServer.set_locale("es")
	else:
		TranslationServer.set_locale("en")
		

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
