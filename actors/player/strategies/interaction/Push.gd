class_name Push extends InteractionStrat

func execute(context : Player):
	var body : Node2D = context.interactionArea.getSelectedBody()
	if body != null && body.has_method("bePushed"):
		body.bePushed()
