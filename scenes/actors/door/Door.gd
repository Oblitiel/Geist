class_name Door extends StaticBody2D

enum Logics {AND, OR}

@export var notLogic : bool = false
@export var generalLogic : Logics = Logics.AND
@export var activators : Array[Activator]

func _ready() -> void:
	for activator in activators:
		activator.stateChanged.connect(activatorChanged)

func activatorChanged(_activatorState : bool):
	match (generalLogic):
		Logics.AND:
			var activated : bool = true
			for activator in activators:
				print(activator.active)
				if activator.active == notLogic:
					activated = false
			open(activated)
		Logics.OR:
			for activator in activators:
				if activator.active != notLogic:
					open(true)

func open(openDoor : bool):
	if openDoor:
		collision_layer = 0
		$Sprite2D.frame = 1
	else :
		collision_layer = 4
		$Sprite2D.frame = 0
