class_name AreaLevelTransition extends Area2D

@export var destination: String

func _ready() -> void:
	body_entered.connect(onBodyEntered)

func onBodyEntered(body: Node2D):
	Global.gameControler.changeScene(destination)
	
