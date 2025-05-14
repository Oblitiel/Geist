extends Control

var MAINSCENE: String = "res://Levels/level.tscn"

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
	get_tree().change_scene_to_file(MAINSCENE)

func exitGame():
	get_tree().quit()
	
func showOptions():
	$OptionsMenu.visible = true

func loadGame():
	pass
