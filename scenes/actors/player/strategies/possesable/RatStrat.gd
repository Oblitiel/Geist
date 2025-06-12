class_name RatStrat extends PossesableStrat

func interact(context : Player) -> void:
	super(context)
	var body : Node2D = context.interactionArea.getSelectedBody("Enterable")
	if body != null && body.has_method("enter"):
		body.enter()

func possess(context : Player) -> void:
	super(context)
