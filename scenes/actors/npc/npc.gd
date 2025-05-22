class_name NPC extends CharacterBody2D

@export var dialog: DialogPlay
@export var possesionData : BodyProperties
@export var sprite: Sprite2D

func _ready():
	$Sprite2D.texture = sprite

func talk():
	Global.gameControler.showDialog(dialog)

func getProperties():
	return possesionData
