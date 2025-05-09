class_name Activate extends InteractionStrat

func execute(context : Player):
	var body : Node2D = context.interactionArea.getSelectedBody()
	if body != null && body.has_method("activate"):
		body.activate()
