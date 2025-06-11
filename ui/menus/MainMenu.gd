extends Control

func _ready():
	if SaveManager.save_exists(1): 
		$VBoxContainer/PlayButton.pressed.connect(play)
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
	Global.gameControler.showOptionsMenu()

func newGame():
	hide()
	Global.gameControler.starNewGame()
