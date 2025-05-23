class_name Box extends CharacterBody2D

var sliding : bool = false
@export_range(0,128,16,"or_greater") var distance: int = 16
@export_range(0,100) var time: float = 0.5

func bePushed(direction: Vector2):
	if not sliding and not test_move(transform, direction * distance):
		var positionTween = create_tween().set_trans(Tween.TRANS_BOUNCE).set_ease(Tween.EASE_OUT).set_process_mode(Tween.TWEEN_PROCESS_IDLE)
		sliding = true
		positionTween.tween_property(self, "position", position + direction * distance, time)
		
		await positionTween.finished
		
		sliding = false
