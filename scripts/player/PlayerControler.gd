class_name Controler extends Node
## Se encarga de recoger las inputs del jugador.
##
## Intermediario entre el jugador y el objeto a controlar, recoge las inputs del juagador y manda instrucciones a un objeto [Controlable].

## Objeto bajo control
@export var _underControl : Controlable

signal characterControlChanged(newControled : Controlable)

func _physics_process(delta: float) -> void:
	if (_underControl):
		_underControl.move(delta, Input.get_vector("left","right","up","down"));

func _input(event: InputEvent) -> void:
	if (event.is_action_pressed("interact") and _underControl):
		_underControl.interact();
	
	if (event.is_action_pressed("possess") and _underControl):
		_underControl.possess();

## Cambia el personaje bajo el control de [Controler]
func setUnderControl(newCharacter : Controlable):
	_underControl = newCharacter
	characterControlChanged.emit(newCharacter)

## Devuelve true si el objeto indicado es el que esta bajo control del jugador
func isUnderControl(character : Controlable) -> bool:
	return _underControl == character
