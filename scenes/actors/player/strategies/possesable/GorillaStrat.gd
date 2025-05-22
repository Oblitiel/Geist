class_name GorillaStrat extends PossessableStrat

func interact(context : Player) -> void:
	print(interact)
	var body : Node2D = context.interactionArea.getSelectedBody()
	if body != null and body.has_method("bePushed"):
		print(body)
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
