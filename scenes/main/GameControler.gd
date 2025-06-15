class_name GameControler extends Node

const SCENE_PATH_FORMAT = "res://scenes/levels/%s.tscn"
const MAIN_LEVEL : String = "main_level"

@export var currentScene : Level
var sceneInMemory : Node2D

func _ready() -> void:
	Global.gameControler = self
	if OS.get_name() in ["Android", "iOS"]:
		$Ui/VirtualControler.show()

func changeScene(newScene: String, delete: bool = true, keepRunning : bool = false):
	if delete:
		if currentScene:
			currentScene.queue_free()
	elif keepRunning:
		currentScene.hide()
	else:
		sceneInMemory  = currentScene
		remove_child(currentScene)
	
	await get_tree().process_frame
	var new = load(SCENE_PATH_FORMAT % newScene).instantiate()
	$World2D.add_child(new)
	currentScene = new
	SaveManager.current_game_state.level = newScene
	SaveManager.save_game()

func showOptionsMenu():
	$Ui/OptionsMenu.show_menu()

func hideOptionsMenu():
	$Ui/OptionsMenu.hide_menu()
	runGame()

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
	$Ui/CoinCounter.update()
	$Ui/PauseMenu.hide_menu()
	changeScene(SaveManager.current_game_state.level)

func continueGame():
	SaveManager.load_game()
	$Ui/CoinCounter.update()
	$Ui/PauseMenu.hide_menu()
	changeScene(SaveManager.current_game_state.level)

func demostrationLevel():
	SaveManager.reset_game_file()
	$Ui/CoinCounter.update()
	$Ui/PauseMenu.hide_menu()
	changeScene("demostration_level")
