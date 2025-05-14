class_name HumanStrat extends PossessableStrat

func interact(context : Player) -> void:
	super(context)
	var body : Node2D = context.interactionArea.getSelectedBody()
	if body != null && body.has_method("activate"):
		body.activate()

func possess(context : Player) -> void:
	super(context)
