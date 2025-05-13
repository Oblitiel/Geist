extends Control

func _ready():
	$VBoxContainer/PlayButton.pressed.connect(play)
	$VBoxContainer/ExitButton.pressed.connect(exitGame)
	
func play():
	get_tree().change_scene_to_file("res://Levels/test_level.tscn")

func exitGame():
	get_tree().quit()
	
