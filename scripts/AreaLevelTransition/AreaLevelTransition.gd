class_name AreaLevelTransition extends Area2D

@export var destination: String

func _ready() -> void:
	body_entered.connect(onBodyEntered)

func onBodyEntered(_body: Node2D):
	Global.gameControler.call_deferred_thread_group("changeScene",destination)
	
