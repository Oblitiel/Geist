class_name CheckpointManager extends Node
## Encargado de buscar los checkpoints del nivel y guardar la posicion en la que tendra que reaparecer el jugador al morir.
## La posicion se actualiza caundo los checkpoints mandan una señal al pasar el jugador por estos.

var respawnPosition: Vector2 ## La posicion en la que aparecera el jugador cuando muera.
@export var defaultCheckpoint: Checkpoint ## Checkpoint por defecto.

func _ready():
	for child in get_children():
		if child is Checkpoint:
			child.playerEntered.connect(setRespawnPosition)
	if defaultCheckpoint:
		respawnPosition = defaultCheckpoint.getRespawnPosition()

## Cambia la posicion de respawn
func setRespawnPosition(newPosition : Vector2):
	respawnPosition = newPosition
