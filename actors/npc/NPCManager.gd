class_name NPCManager extends Node

var dialogNPC: DialogPlay
signal redirectDialog(dialog: DialogPlay)

func _ready():
	for child in get_children():
		child.playerIsInteracting.connect(setDialog)
		redirectDialog.emit(dialogNPC)
		
func setDialog(dialog : DialogPlay):
	dialogNPC = dialog
