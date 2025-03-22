# `class_name` lets us search for the given name in the documentation system.
class_name Player extends CharacterBody2D

## Clase con los metodos comunes de otodos los objetos con los que el jugador puede interactuar.
##
## Clase con los metodos comunes de otodos los objetos con los que el jugador puede interactuar.

@onready var respawnPosition = position

@export var maxSpeed = 100 ## Velocidad maxima a la que puede llegar el jugador
@export var aceleration = 800 ## Aceleracion del jugador
@export var friction = 1200 ## Friccion que se ejerce cunado el jugador deja de moverse

## Devuelve la velocidad teniendo en cuenta la direccion de las inputs la aceleracion y la friccion
func processVelocity(delta):
	var inputVector = Input.get_vector("left","right","up","down")
	var vel = Vector2.ZERO
	
	if inputVector != Vector2.ZERO:
		#Tratar la velocidad del jugador
		velocity = velocity.move_toward(inputVector * maxSpeed, aceleration * delta)
		
		var clampValue = Vector2(maxSpeed, maxSpeed)
		velocity = velocity.clamp(-clampValue,clampValue)
		
	else:
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)

	move_and_slide()

func _physics_process(delta):
	processVelocity(delta)
	move_and_slide()

func die():
	position = respawnPosition
