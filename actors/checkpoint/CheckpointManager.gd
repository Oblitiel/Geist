class_name CheckpointManager extends Node

##la posicion en la que aparecera el jugador cuando muera
var respawnPosition: Marker2D

func _ready():
	for child in get_children():
		if child is Checkpoint:
			child.playerEntered.connect(setRespawnPosition)

##cambia la posicion de respawn
func setRespawnPosition(newPosition : Marker2D):
	respawnPosition = newPosition
