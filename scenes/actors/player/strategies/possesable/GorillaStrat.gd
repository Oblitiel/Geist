class_name GorillaStrat extends PossesableStrat

func interact(context : Player) -> void:
	var body : Node2D = context.interactionArea.getSelectedBody("Pushable")
	if body != null and body.has_method("bePushed"):
		var direction : Vector2 = body.global_position - context.global_position
		if abs(direction.x) > abs(direction.y):
			direction.y = 0
		elif abs(direction.x) < abs(direction.y):
			direction.x = 0
		elif abs(direction.x) == abs(direction.y):
			direction = Vector2.ZERO
		body.bePushed(direction.normalized())

func possess(context : Player) -> void:
	super(context)
