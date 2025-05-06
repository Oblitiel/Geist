extends Control

@export var dialogScript: DialogPlay

func  _ready():
	dialogScript._iter_init()
	update(dialogScript._iter_get())

func  _input(event):
	if event.is_action_pressed("interact"):
		if dialogScript._iter_next():
			update(dialogScript._iter_get())
		else:
			queue_free()

func update(line : DialogLine):
	$TextBox/Text.text = line.text
	$Character.texture = line.image
	$TextBox2/Text2.text = line.name
