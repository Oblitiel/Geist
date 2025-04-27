extends Node2D
class_name Level

@export var spawnManager : CheckpointManager
@export var player : Controlable
@export var camera : CustomCamera

var defaultPlayer = preload("res://actors/player/geist/geist.tscn")

func _ready() -> void:
	if not player:
		player = defaultPlayer.instantiate()
		add_child(player)
	
	player.position = spawnManager.respawnPosition
	PlayerControler.setUnderControl(player)
	
	camera.follow = player
