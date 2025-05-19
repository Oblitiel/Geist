extends Control

func _ready():
	$VBoxContainer/PlayButton.pressed.connect(play)
	$VBoxContainer/ExitButton.pressed.connect(exitGame)
	$VBoxContainer/OptionsButton.pressed.connect(showOptions)
	$VBoxContainer/LoadButton.pressed.connect(loadGame)

func play():
	hide()
	Global.gameControler.changeScene("gabriel_test_level")

func exitGame():
	get_tree().quit()
	
func showOptions():
	$OptionsMenu.show()

func loadGame():
	pass
