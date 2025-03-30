class_name Geist extends Controlable
## Especificacion de la clase [Controlable]
##
## Personaje jugable Geist, tiene colision en la capa [b]Player[/b] y [b]Light[/b]; busca colisiones en [b]Wall[/b].
## [br]
## Si esta cerca de un Objeto [Possessable] se pasara el control al objeto poseido cuando el jugador lo ordene

@export var maxSpeed = 100 ## Velocidad maxima a la que puede llegar el jugador
@export var aceleration = 800 ## Aceleracion del jugador
@export var friction = 1200 ## Friccion que se ejerce cunado el jugador deja de moverse

func move(delta, direction : Vector2) -> void:
	
	if direction != Vector2.ZERO:
		#Tratar la velocidad del jugador
		velocity = velocity.move_toward(direction * maxSpeed, aceleration * delta)
		
		var clampValue = Vector2(maxSpeed, maxSpeed)
		velocity = velocity.clamp(-clampValue,clampValue)
		
	else:
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
	move_and_slide()

func interact() -> void:
	print("Intractuo")
	print(%PossessionArea.get_overlapping_bodies())
