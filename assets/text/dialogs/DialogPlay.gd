class_name DialogPlay extends Resource

#array con las lineas del dialogo
@export var dialogScript: Array[DialogLine]

#variables para iterar
var start: int = 0
var current: int = 0
var end: int

#funciones para hacer la clase iterable
func shouldContinue():
	return (current < end)

func _iter_init(iter):
	end = dialogScript.size()
	return shouldContinue()

func _iter_next(iter):
	current += 1
	return shouldContinue()

func _iter_get(iter):
	return dialogScript[current]
	
class DialogLine extends Resource:
	@export var name:String
	@export var text:String
	@export var image:CompressedTexture2D
