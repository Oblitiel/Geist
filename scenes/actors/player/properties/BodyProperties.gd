class_name BodyProperties extends Resource

# Para añadir una strategia de un cuerpo hay que añadir la entrada
# tanto en el diccionario como en el export_enum de strategy
static var bodies_strat : Dictionary[String, Callable] = {
	"Geist" : func (): return GeistStrat.new(),
	"Human" : func (): return HumanStrat.new(),
	"Rat" : func (): return RatStrat.new(),
	"Gorilla" : func (): return GorillaStrat.new(),
}

@export var texture : Texture2D
@export_enum("Geist", "Human","Rat","Gorilla") var _strategy : String

@export_flags_2d_physics var colisionLayer : int = 1
@export_flags_2d_physics var colisionMask : int = 12

func getStrategy() -> PlayerStrat:
	return bodies_strat[_strategy].call()
