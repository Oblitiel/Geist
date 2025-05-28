extends StaticBody2D

@export var destination: String

func enter():
	Global.gameControler.changeScene(destination)
