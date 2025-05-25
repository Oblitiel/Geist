class_name Lever extends Activator

func activate():
	if active:
		$Sprite2D.frame = 0
	else:
		$Sprite2D.frame = 1
	active = !active
