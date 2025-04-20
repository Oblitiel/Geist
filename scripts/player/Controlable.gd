class_name Controlable extends CharacterBody2D
## Clase padre que unicamente declara los metodos que deben implementar su hijo, se usa en vez de una interface por que no existen en godot.

func move(_delta, _direction : Vector2) -> void:
	pass

func interact() -> void:
	pass

func possess() -> void:
	pass

func die() -> void:
	pass
