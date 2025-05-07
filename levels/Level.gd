extends Node2D
class_name Level

@export var spawnManager : CheckpointManager
@export var player : Player
@export var camera : CustomCamera


func _ready() -> void:
	player.position = spawnManager.respawnPosition
	PlayerControler.underControl = player
	player.connect("dead",_on_player_dead)
	
	camera.follow = player

func _on_player_dead():
	player.respawn(spawnManager.respawnPosition)
