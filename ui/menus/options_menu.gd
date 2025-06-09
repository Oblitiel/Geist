extends Control

func _on_exit_button_pressed():
	if visible:
		hide()

func _on_option_button_item_selected(index):
	if index == 0:
		TranslationServer.set_locale("es")
	else:
		TranslationServer.set_locale("en")
		
