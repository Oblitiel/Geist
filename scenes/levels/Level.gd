extends Node2D
class_name Level

@export var spawnManager : CheckpointManager
@export var player : Player
@export var camera : CustomCamera

func _ready() -> void:
	player.global_position = spawnManager.respawnPosition
	PlayerControler.underControl = player
	
	camera.follow = player
	
	player.dead.connect(_on_player_dead)

func _on_player_dead():
	player.respawn(spawnManager.respawnPosition)
