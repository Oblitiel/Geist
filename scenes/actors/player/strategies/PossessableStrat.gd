class_name PossessableStrat extends PlayerStrat

var geist = preload("res://scenes/actors/player/properties/geist.tres")

func interact(context : Player) -> void:
	super(context)

func possess(context : Player) -> void:
	context.changePorperties(geist)
	
	Global.gameControler.add_child(context.oldBody)
	context.oldBody.position = context.global_position
