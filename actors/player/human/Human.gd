extends Player

var possed

func _physics_process(delta):
	processVelocity(delta)
	move_and_slide()
