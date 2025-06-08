class_name Player extends CharacterBody2D
## Clase padre que unicamente declara los metodos que deben implementar su hijo, se usa en vez de una interface por que no existen en godot.

signal dead()

@export var maxSpeed = 100 ## Velocidad maxima a la que puede llegar el jugador
@export var aceleration = 800 ## Aceleracion del jugador
@export var friction = 1200 ## Friccion que se ejerce cunado el jugador deja de moverse

@onready var interactionArea: InteractionArea = $InteractionArea

@export var bodyProperies : BodyProperties = preload("res://scenes/actors/player/properties/geist.tres")

var oldBody : Node2D = self

func _ready() -> void:
	changePorperties(bodyProperies)

## Dado delta y un [Vector2] direccion calcula la velocidad de personaje y llama al metodo move_and_slide() de la clase [CharacterBody2D].
func move(delta, direction : Vector2) -> void:
	if direction != Vector2.ZERO:
		velocity = velocity.move_toward(direction * maxSpeed, aceleration * delta)
		velocity = velocity.clamp(-Vector2(maxSpeed, maxSpeed), Vector2(maxSpeed, maxSpeed))
		
	else:
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
		
	move_and_slide()

func interact() -> void:
	bodyProperies.getStrategy().interact(self)

func possess() -> void:
	bodyProperies.getStrategy().possess(self)

func die() -> void:
	dead.emit()

func respawn(respawPosition : Vector2) -> void:
	global_position = respawPosition

func changePorperties(properties : BodyProperties) -> void:
	bodyProperies = properties
	$Sprite.texture = properties.texture
	collision_layer = properties.colisionLayer
	collision_mask = properties.colisionMask
