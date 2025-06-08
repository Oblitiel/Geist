extends MarginContainer


func _on_possess_button_down() -> void:
	PlayerControler.possess()

func _on_interact_button_down() -> void:
	PlayerControler.interact()
