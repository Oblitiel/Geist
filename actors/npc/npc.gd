class_name NPC extends CharacterBody2D

@export var dialog: DialogPlay
signal playerIsInteracting(dialog : DialogPlay)

func interact():
	playerIsInteracting.emit(dialog)
