class_name Controlable extends CharacterBody2D
## Clase padre que unicamente declara los metodos que deben implementar su hijo, se usa en vez de una interface por que no existen en godot.

## Se activa cuando se debe cambiar el personaje
signal changeCharacter(newCharacter : Controlable)

func move(_delta, _direction : Vector2) -> void:
	pass

func interact() -> void:
	pass

func possess() -> void:
	pass

func die() -> void:
	pass
