extends Area2D

##Al estrar un cuerpo en el area, si es el fantasma se muere
func _on_body_entered(body):
	if body is Player:
		body.die()
