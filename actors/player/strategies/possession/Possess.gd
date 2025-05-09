class_name Possess extends PossessionStrat

func execute(context : Player):
	var body : Node2D = context.interactionArea.getSelectedBody()
	if body != null and body.has_method("getPossesionValue"):
		body.getPossesionValue().changePlayer(context)
		#TODO: Esto es un poco guarrindongo
		hide(body)
		context.oldBody = body

func hide(body : Node2D):
	body.global_position = Vector2(-32,-32)
	body.hide()
