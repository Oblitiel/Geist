class_name Controlable extends CharacterBody2D
## Clase padre que unicamente declara los metodos que deben implementar su hijo, se usa en vez de una interface por que no existen en godot.

signal dead()
signal controlChanged(body)

@export var maxSpeed = 100 ## Velocidad maxima a la que puede llegar el jugador
@export var aceleration = 800 ## Aceleracion del jugador
@export var friction = 1200 ## Friccion que se ejerce cunado el jugador deja de moverse

func move(_delta, _direction : Vector2) -> void:
	pass

func interact() -> void:
	pass

func possess() -> void:
	pass

func die() -> void:
	pass

func respawn(position : Vector2) -> void:
	pass
