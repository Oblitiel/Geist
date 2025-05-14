class_name GameControler extends Node

@export var currentScene : Node2D
var sceneInMemory : Node2D

func _ready() -> void:
	Global.gameControler = self

func changeScene(newScene: String, delete: bool = true, keepRunning : bool = false):
	if delete:
		currentScene.queue_free()
	elif keepRunning:
		currentScene.hide()
	else:
		sceneInMemory  = currentScene
		remove_child(currentScene)
	
	var new = load("res://scenes/levels/" + newScene + ".tscn").instantiate()
	add_child(new)
	currentScene = new

func showOptionsMenu():
	pauseGame()
	pass

func hideOptionsMenu():
	runGame()
	pass

func showDialog(dialogPlay : DialogPlay):
	pauseGame()
	$Ui/DialogScreen.start(dialogPlay)

func pauseGame():
	get_tree().paused = true

func runGame():
	get_tree().paused = false
