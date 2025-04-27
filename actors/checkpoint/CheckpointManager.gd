class_name CheckpointManager extends Node

##la posicion en la que aparecera el jugador cuando muera
var respawnPosition: Vector2
@export var defaultCheckpoint: Checkpoint

func _ready():
	for child in get_children():
		if child is Checkpoint:
			child.playerEntered.connect(setRespawnPosition)
	if defaultCheckpoint:
		respawnPosition = defaultCheckpoint.getRespawnPosition()

##cambia la posicion de respawn
func setRespawnPosition(newPosition : Vector2):
	respawnPosition = newPosition
