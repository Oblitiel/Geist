class_name NPCManager extends Node

signal redirectDialog(dialog: DialogPlay)

func _ready():
	for child in get_children():
		child.playerIsInteracting.connect(forwarder)

func forwarder(dialog : DialogPlay):
	redirectDialog.emit(dialog)
