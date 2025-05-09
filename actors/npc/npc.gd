class_name NPC extends CharacterBody2D

@export var dialog: DialogPlay
@export var possesionData : PossesionProperties
signal playerIsInteracting(dialog : DialogPlay)

func talk():
	playerIsInteracting.emit(dialog)

func getPossesionValue():
	return possesionData
