extends Node2D
class_name Level

@export var spawnManager : CheckpointManager
@export var player : Controlable :
	set(value):
		if player:
			player.controlChanged.disconnect(_on_player_changed)
			player.dead.disconnect(_on_player_dead)
		value.controlChanged.connect(_on_player_changed)
		value.dead.connect(_on_player_dead)
		player = value
@export var camera : CustomCamera

var defaultPlayer = preload("res://actors/player/geist/geist.tscn")

func _ready() -> void:
	if not player:
		player = defaultPlayer.instantiate()
		add_child(player)
	
	player.position = spawnManager.respawnPosition
	PlayerControler.setUnderControl(player)
	
	camera.follow = player

func _on_player_changed(newBody):
	camera.follow = newBody

func _on_player_dead():
	player.respawn(spawnManager.respawnPosition)
