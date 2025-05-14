class_name GorillaStrat extends PossessableStrat

func interact(context : Player) -> void:
	super(context)
	var body : Node2D = context.interactionArea.getSelectedBody()
	if body != null && body.has_method("bePushed"):
		body.bePushed()

func possess(context : Player) -> void:
	super(context)
