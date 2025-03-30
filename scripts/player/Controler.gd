class_name Controler extends Node
## Se encarga de recoger las inputs del jugador.
##
## Intermediario entre el jugador y el objeto a controlar, recoge las inputs del juagador y manda instrucciones a un objeto [Controlable].

## Objeto bajo control
@export var underControl : Controlable :
	set(value):
		if (underControl != null): underControl.controler = null
		value.controler = self
		underControl = value

func _physics_process(delta: float) -> void:
	if (underControl):
		underControl.move(delta, Input.get_vector("left","right","up","down"));

func _input(event: InputEvent) -> void:
	if (event.is_action_pressed("interact") and underControl):
		underControl.interact();
