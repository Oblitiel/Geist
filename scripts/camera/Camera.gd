class_name CustomCamera extends Camera2D

@export var follow : Node2D

func _physics_process(_delta: float) -> void:
	if (follow):
		position = follow.position
