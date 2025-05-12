class_name GeistStrat extends PlayerStrat

func interact(context : Player) -> void:
	var body : Node2D = context.interactionArea.getSelectedBody()
	if body != null && body.has_method("talk"):
		body.talk()

func possess(context : Player) -> void:
	var body : Node2D = context.interactionArea.getSelectedBody()
	if body != null and body.has_method("getProperties"):
		context.changePorperties(body.getProperties())
		
		hide(body)
		context.oldBody = body

func hide(body : Node2D):
	body.global_position = Vector2(-32,-32)
	body.hide()
