class_name NPC extends CharacterBody2D

@export var dialog: DialogPlay
@export var possesionData : BodyProperties

func talk():
	Global.gameControler.showDialog(dialog)
	print("pene")

func getProperties():
	return possesionData
