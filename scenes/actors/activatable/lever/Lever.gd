class_name Lever extends Activator

func activate():
	if active:
		$Sprite2D.frame = 0
		deactivated.emit()
	else:
		$Sprite2D.frame = 1
		activated.emit()
	active = !active
