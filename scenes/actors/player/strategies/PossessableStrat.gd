class_name PossesableStrat extends PlayerStrat

func possess(context : Player) -> void:
	context.changePorperties(load("res://scenes/actors/player/properties/geist.tres"))
	
	Global.gameControler.currentScene.add_child(context.oldBody)
	context.oldBody.position = context.global_position
