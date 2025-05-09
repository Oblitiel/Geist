class_name Depossess extends PossessionStrat

const GEIST = preload("res://actors/player/possessionRes/Geist.tres")

func execute(context : Player):
	show(context.oldBody, context.global_position)
	GEIST.changePlayer(context)

func show(body: Node2D, position : Vector2):
	body.position = position
	body.show()
