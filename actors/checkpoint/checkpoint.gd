extends Area2D


func _ready():
	connect("body_entered", characterEnters)
	
func characterEnters(character):
		if character is Player:
			character.respawnPosition = character.position
