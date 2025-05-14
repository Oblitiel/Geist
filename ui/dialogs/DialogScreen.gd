class_name DialogScreen extends Control

var dialogPlay: DialogPlay

func start(newDialogPlay: DialogPlay):
	dialogPlay = newDialogPlay
	dialogPlay._iter_init()
	update(dialogPlay._iter_get())
	

func  _input(event):
	if event.is_action_pressed("interact"):
		if dialogPlay._iter_next():
			update(dialogPlay._iter_get())
		else:
			Global.gameControler.runGame()
			hide()

func update(line : DialogLine):
	$TextBox/Text.text = line.text
	$Character.texture = line.image
	$TextBox2/Text2.text = line.name
