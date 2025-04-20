class_name Geist extends Controlable
## Especificacion de la clase [Controlable]
##
## Personaje jugable Geist, tiene colision en la capa [b]Player[/b] y [b]Light[/b]; busca colisiones en [b]Wall[/b].
## [br]
## Si esta cerca de un Objeto [Possessable] se pasara el control al objeto poseido cuando el jugador lo ordene

@export var maxSpeed = 100 ## Velocidad maxima a la que puede llegar el jugador
@export var aceleration = 800 ## Aceleracion del jugador
@export var friction = 1200 ## Friccion que se ejerce cunado el jugador deja de moverse

@onready var possessionArea: PossessionArea = $PossessionArea

## Dado delta y un [Vector2] direccion calcula la velocidad de personaje y llama al metodo move_and_slide() de la clase [CharacterBody2D].
func move(delta, direction : Vector2) -> void:
	if direction != Vector2.ZERO:
		velocity = velocity.move_toward(direction * maxSpeed, aceleration * delta)
		velocity = velocity.clamp(-Vector2(maxSpeed, maxSpeed), Vector2(maxSpeed, maxSpeed))
		
	else:
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
		
	move_and_slide()

## Si hay un objeto controlable en el area pasa el control a ese objeto
func possess() -> void:
	if (possessionArea.getSelectedBody() != null):
		PlayerControler.setUnderControl(possessionArea._selectedBody)
		vanish()

func vanish() -> void:
	queue_free()

func die() -> void:
	vanish()
