class_name Depossess extends PossessionStrat

const GEIST = preload("res://actors/player/possessionRes/Geist.tres")

func execute(context : Player):
	context.oldBody.position = context.position
	GEIST.changePlayer(context)
