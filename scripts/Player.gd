class_name Player
extends CharacterBody2D

@export var maxSpeed = 100
@export var aceleration = 800
@export var friction = 1200

func _physics_process(delta):
	var inputVector = Vector2.ZERO
	
	inputVector.x = Input.get_axis("left","right")
	inputVector.y = Input.get_axis("up","down")
	
	inputVector = inputVector.normalized()
	
	if inputVector != Vector2.ZERO:
		
		#Tratar la velocidad del jugador
		velocity = velocity.move_toward(inputVector * maxSpeed, aceleration * delta)
		
		var clampValue = Vector2(maxSpeed, maxSpeed)
		velocity = velocity.clamp(-clampValue,clampValue)
		
	else:
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)

	move_and_slide()
