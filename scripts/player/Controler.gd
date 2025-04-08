class_name Controler extends Node
## Se encarga de recoger las inputs del jugador.
##
## Intermediario entre el jugador y el objeto a controlar, recoge las inputs del juagador y manda instrucciones a un objeto [Controlable].

## Objeto bajo control [br]
@export var underControl : Controlable

func _ready() -> void:
	changeCharacter(underControl)

func _physics_process(delta: float) -> void:
	if (underControl):
		underControl.move(delta, Input.get_vector("left","right","up","down"));

func _input(event: InputEvent) -> void:
	if (event.is_action_pressed("interact") and underControl):
		underControl.interact();
	
	if (event.is_action_pressed("possess") and underControl):
		underControl.possess();

## Cambia el personaje bajo el control de [Controler], hace que el nuevo objeto bajo control lo guarde en referencia y borra la referencia del antiguo.
func changeCharacter(newCharacter : Controlable):
	if (underControl != null and underControl.changeCharacter.is_connected(changeCharacter)):
		underControl.changeCharacter.disconnect(changeCharacter)
	
	underControl = newCharacter
	underControl.changeCharacter.connect(changeCharacter)
	
