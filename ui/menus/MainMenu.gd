extends Control

const MAIN_LEVEL : String = "nerea_level"

func _ready():
	if FileAccess.file_exists(SaveManager.get_save_file_path(1)): 
		$VBoxContainer/PlayButton. pressed.connect(play)
	else:
		$VBoxContainer/PlayButton.disabled = true
	$VBoxContainer/ExitButton.pressed.connect(exitGame)
	$VBoxContainer/OptionsButton.pressed.connect(showOptions)
	$VBoxContainer/NewGameButton.pressed.connect(newGame)

func play():
	hide()
	SaveManager.load_game()

func exitGame():
	get_tree().quit()
	
func showOptions():
	$OptionsMenu.show()

func newGame():
	hide()
	Global.gameControler.changeScene(MAIN_LEVEL)
