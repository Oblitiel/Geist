class_name PossesionProperties extends Resource

@export var texture : Texture2D
@export var strategies : StrategySet
# Esto es una movida a espera de un arreglo mejor se va a quedar asi
@export var colisionLayer : int = 3
@export var colisionMask : int = 12

func changePlayer(contex : Player):
	contex.sprite.texture = texture
	contex.strategySet = strategies
	contex.collision_layer = colisionLayer
	contex.collision_mask = colisionMask
