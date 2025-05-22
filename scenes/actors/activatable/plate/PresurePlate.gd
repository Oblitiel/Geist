extends Activator

func _on_area_2d_body_entered(body: Node2D) -> void:
	$Sprite2D.frame = 1
	active = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	$Sprite2D.frame = 0
	active = false
