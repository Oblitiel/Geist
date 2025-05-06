extends Control

@export var dialogScript: DialogPlay
var line : int = 0

func  _ready():
	update(line)

func  _input(event):
	if event.is_action_pressed("interact"):
		line += 1
		if line >= dialogScript.size():
			queue_free()
		else:
			update(line)

func update(index):
	$TextBox/Text.text = dialogScript[index].text
	$Character.texture = dialogScript[index].image
	$TextBox2/Text2.text = dialogScript[index].name
