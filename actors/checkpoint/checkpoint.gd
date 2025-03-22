extends Area2D
class_name Checkpoint


func _ready():
	connect("body_entered", _on_body_entered)

## Al entrar un cuerpo en el area, si es el jugador cambia su posicion de reaparicion a la del area
func _on_body_entered(body):
	if body is Player:
		body.respawnPosition = body.position
