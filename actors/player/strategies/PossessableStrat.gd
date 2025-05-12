class_name PossessableStrat extends PlayerStrat

const GEIST = preload("res://actors/player/properties/geist.tres")

func interact(context : Player) -> void:
	super(context)

func possess(context : Player) -> void:
	show(context.oldBody, context.global_position)
	context.changePorperties(GEIST)

func show(body: Node2D, position : Vector2):
	body.position = position
	body.show()
