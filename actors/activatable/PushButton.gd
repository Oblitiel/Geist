class_name PushButton extends Activator

@export var buttonTime : float = 1
@onready var timer: Timer = $Timer

func activate():
	active = true
	timer.wait_time = buttonTime
	timer.start()
	await timer.timeout
	active = false
