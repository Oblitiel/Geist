class_name DialogScreen extends Control

@export var dialogPlay: DialogPlay

func _ready():
	dialogPlay._iter_init()
	update(dialogPlay._iter_get())

func  _input(event):
	if event.is_action_pressed("interact"):
		if dialogPlay._iter_next():
			update(dialogPlay._iter_get())
		else:
			queue_free()

func update(line : DialogLine):
	$TextBox/Text.text = line.text
	$Character.texture = line.image
	$TextBox2/Text2.text = line.name
