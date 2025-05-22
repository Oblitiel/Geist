extends Control

const MAIN_LEVEL : String = "gabriel_test_level"

func _ready():
	$VBoxContainer/PlayButton.pressed.connect(play)
	$VBoxContainer/ExitButton.pressed.connect(exitGame)
	$VBoxContainer/OptionsButton.pressed.connect(showOptions)
	$VBoxContainer/LoadButton.pressed.connect(loadGame)

func play():
	hide()
	Global.gameControler.changeScene(MAIN_LEVEL)

func exitGame():
	get_tree().quit()
	
func showOptions():
	$OptionsMenu.show()

func loadGame():
	pass
