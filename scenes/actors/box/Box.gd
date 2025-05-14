class_name Box extends CharacterBody2D

@onready var directions: Directions = $Directions
var positionTween : Tween

func bePushed():
	positionTween = create_tween().set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_IN_OUT)
	positionTween.set_process_mode(Tween.TWEEN_PROCESS_IDLE)
	if !positionTween.is_running():
		if (directions.getMoveDirection() != directions.getCollisionDirection()):
			positionTween.tween_property(self, "position", position + directions.getMoveDirection() * 16,1)
