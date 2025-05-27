class_name DialogScreen extends Control

var dialogPlay: DialogPlay

func start(newDialogPlay: DialogPlay):
	print("empieza el dialogo")
	dialogPlay = newDialogPlay
	dialogPlay._iter_init()
	update(dialogPlay._iter_get())
	print("acaba la func start")
	

func  _input(event):
	if event.is_action_pressed("interact"):
		if dialogPlay._iter_next():
			update(dialogPlay._iter_get())
		else:
			hide()
			Global.gameControler.runGame()
			accept_event()
			

func update(line : DialogLine):
	$TextBox/Text.text = line.text
	$Character.texture = line.image
	$TextBox2/Text2.text = line.name
