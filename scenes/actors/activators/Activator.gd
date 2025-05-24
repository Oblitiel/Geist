class_name Activator extends StaticBody2D

@export var active : bool = false :
	set = setActive
signal stateChanged(active : bool) 

func activate():
	pass

func setActive(val : bool):
	active = val
	stateChanged.emit(active)
