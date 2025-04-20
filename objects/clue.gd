class_name Clue extends Area2D


func _on_body_entered(body):
	if PlayerControler.isUnderControl(body):
		pass
