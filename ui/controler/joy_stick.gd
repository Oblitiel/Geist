extends MarginContainer

func _on_up_button_down() -> void:
	Input.action_press("up")

func _on_up_button_up() -> void:
	Input.action_release("up")

func _on_rigth_button_down() -> void:
	Input.action_press("right")

func _on_rigth_button_up() -> void:
	Input.action_release("right")

func _on_left_button_down() -> void:
	Input.action_press("left")

func _on_left_button_up() -> void:
	Input.action_release("left")

func _on_down_button_down() -> void:
	Input.action_press("down")

func _on_down_button_up() -> void:
	Input.action_release("down")
