class_name Human extends Controlable
## Especificacion de la clase [Controlable]
##
## Personaje jugable Human, tiene colision en la capa [b]Player[/b] ; busca colisiones en [b]Wall[/b].
## [br]
## Es capaz de interactuar con objetos actibables.

@export var maxSpeed = 100 ## Velocidad maxima a la que puede llegar el jugador
@export var aceleration = 800 ## Aceleracion del jugador
@export var friction = 1200 ## Friccion que se ejerce cunado el jugador deja de moverse

func move(delta, direction : Vector2) -> void:
	if direction != Vector2.ZERO:
		velocity = velocity.move_toward(direction * maxSpeed, aceleration * delta)
		velocity = velocity.clamp(-Vector2(maxSpeed, maxSpeed), Vector2(maxSpeed, maxSpeed))
		
	else:
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
		
	move_and_slide()
