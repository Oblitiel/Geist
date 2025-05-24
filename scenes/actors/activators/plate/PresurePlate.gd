extends Activator



func _on_area_2d_body_entered(_body: Node2D) -> void:
	$Sprite2D.frame = 1
	active = true


func _on_area_2d_body_exited(_body: Node2D) -> void:
	if $Area2D.get_overlapping_bodies().is_empty():
		$Sprite2D.frame = 0
		active = false
