extends Area2D


func _ready():
	connect("body_entered", _on_body_entered)
	
##Al estrar un cuerpo en el area, si es el fantasma se muere
func _on_body_entered(body):
	if body is Geist:
		body.die() 
		
