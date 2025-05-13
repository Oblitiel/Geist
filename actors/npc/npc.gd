class_name NPC extends CharacterBody2D

@export var dialog: DialogPlay
@export var possesionData : BodyProperties
signal playerIsInteracting(dialog : DialogPlay)

func talk():
	playerIsInteracting.emit(dialog)

func getProperties():
	return possesionData
