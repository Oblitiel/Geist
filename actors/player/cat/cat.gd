class_name Cat extends Controlable
## Especificacion de la clase [Controlable]
##
## Personaje jugable Cat, tiene colision en la capa [b]Player[/b] ; busca colisiones en [b]Wall[/b] ¿¿¿y las evita en [b]ClimeableWall[/b]???.
## [br]
## ¿¿¿Más velocidad / asusta ratones??? Capaz de trepar muros.s

func move(delta, direction : Vector2) -> void:
	if direction != Vector2.ZERO:
		velocity = velocity.move_toward(direction * maxSpeed, aceleration * delta)
		velocity = velocity.clamp(-Vector2(maxSpeed, maxSpeed), Vector2(maxSpeed, maxSpeed))
		
	else:
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
		
	move_and_slide()
