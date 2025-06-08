class_name Controler extends Node
## Se encarga de recoger las inputs del jugador.
##
## Intermediario entre el jugador y el objeto a controlar, recoge las inputs del juagador y manda instrucciones a un objeto [Controlable].

## Objeto bajo control
#@export var underControl : Controlable
@export var underControl : Player

#signal characterControlChanged(newControled : Controlable)

func _physics_process(delta: float) -> void:
	if (underControl):
		underControl.move(delta, Input.get_vector("left","right","up","down"))

func _input(event: InputEvent) -> void:
	if (event.is_action_pressed("interact")):
		interact()
	
	if (event.is_action_pressed("possess")):
		possess()

func interact():
	if underControl:
		underControl.interact()

func possess():
	if underControl:
		underControl.possess()

func isUnderControl(character : Player) -> bool:
	return underControl == character
