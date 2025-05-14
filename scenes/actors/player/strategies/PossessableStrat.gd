class_name PossessableStrat extends PlayerStrat

var geist = preload("res://scenes/actors/player/properties/geist.tres")

func interact(context : Player) -> void:
	super(context)

func possess(context : Player) -> void:
	show(context.oldBody, context.global_position)
	context.changePorperties(geist)

func show(body: Node2D, position : Vector2):
	body.position = position
	body.show()
