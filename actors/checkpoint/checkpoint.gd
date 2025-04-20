extends Area2D
class_name Checkpoint

signal playerEntered(checkpointPosition: Marker2D)

## Al entrar un cuerpo en el area, si es el jugador cambia su posicion de reaparicion a la del area
func _on_body_entered(body):
	if PlayerControler.isUnderControl(body):
		playerEntered.emit($Marker2D)
