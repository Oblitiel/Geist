extends Node2D
class_name Level

@export var spawnManager : CheckpointManager
@export var player : Player
@export var camera : CustomCamera
@export var npcManager: NPCManager

var dialogScreen = preload("res://ui/dialog.tscn")

func _ready() -> void:
	player.position = spawnManager.respawnPosition
	PlayerControler.underControl = player
	
	camera.follow = player
	
	player.dead.connect(_on_player_dead)
	npcManager.redirectDialog.connect(showDialog)

func _on_player_dead():
	player.respawn(spawnManager.respawnPosition)

func showDialog(dialogPlay: DialogPlay):
	var dialogInstance: DialogScreen = dialogScreen.instantiate()
	dialogInstance.dialogPlay = dialogPlay
	$CanvasLayer.add_child(dialogInstance)
