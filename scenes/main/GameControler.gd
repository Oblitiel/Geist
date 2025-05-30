class_name GameControler extends Node

const SCENE_PATH_FORMAT = "res://scenes/levels/%s.tscn"
const MAIN_LEVEL : String = "level"

@export var currentScene : Node2D
var sceneInMemory : Node2D

func _ready() -> void:
	Global.gameControler = self

func changeScene(newScene: String, delete: bool = true, keepRunning : bool = false):
	if delete:
		if currentScene:
			currentScene.queue_free()
	elif keepRunning:
		currentScene.hide()
	else:
		sceneInMemory  = currentScene
		remove_child(currentScene)
	
	var new = load(SCENE_PATH_FORMAT % newScene).instantiate()
	$World2D.add_child(new)
	currentScene = new
	SaveManager.current_game_state.level = newScene

func showOptionsMenu():
	pauseGame()
	pass

func hideOptionsMenu():
	runGame()
	pass

func showDialog(dialogPlay : DialogPlay):
	pauseGame()
	$Ui/DialogScreen.start(dialogPlay)
	$Ui/DialogScreen.show()

func pauseGame():
	get_tree().paused = true

func runGame():
	get_tree().paused = false

func addCoin():
	$Ui/CoinCounter.update()

func starNewGame():
	SaveManager.reset_game_file()
	changeScene(SaveManager.current_game_state.level)

func continueGame():
	SaveManager.reset_game_file()
	changeScene(SaveManager.current_game_state.level)
