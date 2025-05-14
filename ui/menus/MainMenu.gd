extends Control

func _ready():
	$VBoxContainer/PlayButton.pressed.connect(play)
	$VBoxContainer/ExitButton.pressed.connect(exitGame)
	$VBoxContainer/OptionsButton.pressed.connect(showOptions)
	$VBoxContainer/LoadButton.pressed.connect(loadGame)
	
func _input(event):
	if event.is_action_released("ui_cancel"):
		if $OptionsMenu.visible == true:
			$OptionsMenu.visible = false
	
func play():
	Global.gameControler.changeScene("gabriel_test_level")

func exitGame():
	get_tree().quit()
	
func showOptions():
	$OptionsMenu.visible = true

func loadGame():
	pass
