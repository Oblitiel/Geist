class_name NPC extends CharacterBody2D

@export var dialog: DialogPlay
signal playerIsInteracting(dialog : DialogPlay)

func talk():
	playerIsInteracting.emit(dialog)
