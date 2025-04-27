class_name gorilla extends Controlable
## Especificacion de la clase [Controlable]
##
## Personaje jugable Gorilla, tiene colision en la capa [b]Player[/b] ; busca colisiones en [b]Wall[/b].
## [br]
## Es capaz de mover cajas a voluntad, ¿¿¿Lanzamiento de barril / más lento???.

func move(delta, direction : Vector2) -> void:
	if direction != Vector2.ZERO:
		velocity = velocity.move_toward(direction * maxSpeed, aceleration * delta)
		velocity = velocity.clamp(-Vector2(maxSpeed, maxSpeed), Vector2(maxSpeed, maxSpeed))
		
	else:
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
		
	move_and_slide()
