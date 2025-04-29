class_name Geist extends Controlable
## Especificacion de la clase [Controlable]
##
## Personaje jugable Geist, tiene colision en la capa [b]Player[/b] y [b]Light[/b]; busca colisiones en [b]Wall[/b].
## [br]
## Si esta cerca de un Objeto [Possessable] se pasara el control al objeto poseido cuando el jugador lo ordene

@onready var possessionArea: PossessionArea = $PossessionArea

## Si hay un objeto controlable en el area pasa el control a ese objeto
func possess() -> void:
	if (possessionArea.getSelectedBody() != null):
		PlayerControler.setUnderControl(possessionArea.getSelectedBody())
		controlChanged.emit(possessionArea.getSelectedBody())
		vanish()

func vanish() -> void:
	queue_free()

func die() -> void:
	vanish()
