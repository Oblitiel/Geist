extends Node2D

@export_color_no_alpha var unActive
@export_color_no_alpha var active

@export var power : Activator

func _process(_delta: float) -> void:
	if power.active:
		$ColorRect.color = active
	else:
		$ColorRect.color = unActive
