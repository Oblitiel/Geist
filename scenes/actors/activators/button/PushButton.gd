class_name PushButton extends Activator

@export var buttonTime : float = 1
@onready var timer: Timer = $Timer

func activate():
	active = true
	$Sprite2D.frame = 1
	
	timer.wait_time = buttonTime
	timer.start()
	
	await timer.timeout
	active = false
	$Sprite2D.frame = 0
