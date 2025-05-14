class_name Directions extends Node2D

@onready var north: RayCast2D = $North
@onready var south: RayCast2D = $South
@onready var east: RayCast2D = $East
@onready var weast: RayCast2D = $Weast

func getMoveDirection():
	if south.is_colliding():
		return Vector2(0,-1)
	elif north.is_colliding():
		return Vector2(0,1)
	elif east.is_colliding():
		return Vector2(-1,0)
	elif weast.is_colliding():
		return Vector2(1,0)

func getCollisionDirection():
	if south.is_colliding():
		return Vector2(0,1)
	elif north.is_colliding():
		return Vector2(0,-1)
	elif east.is_colliding():
		return Vector2(1,0)
	elif weast.is_colliding():
		return Vector2(-1,0)
