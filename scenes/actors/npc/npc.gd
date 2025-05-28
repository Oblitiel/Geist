@tool
class_name NPC
extends CharacterBody2D

@export var dialog: DialogPlay
@export var possesionData : BodyProperties
@export var texture: Texture2D = preload("res://assets/Missing.png") :
	set = setSprite


func talk():
	if dialog:
		Global.gameControler.showDialog(dialog)

func getProperties():
	return possesionData

func setSprite(newTexture : Texture2D):
	texture = newTexture
	$Sprite2D.texture = texture
	$Sprite2D.offset = Vector2(0, - snappedi(texture.get_height() / 2.0,1))
