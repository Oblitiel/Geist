class_name PossessionArea extends Area2D
## Este nodo se encarga de recopilar los cuerpos [Controlable] dentro de su area y elegir el mas cercano a su centro.

var _selectedBody : Controlable

func _process(_delta: float) -> void:
	_selectedBody = _selectBody()

func _selectBody() -> Controlable:
	if (get_overlapping_bodies().is_empty()):
		return null
	if (get_overlapping_bodies().size() == 1):
		return get_overlapping_bodies()[0]
	
	var selected : Controlable = null
	
	for body in get_overlapping_bodies():
		if (selected == null):
			selected = body
		if (body.global_position - global_position > _selectedBody.global_position - global_position):
			selected = body
	
	return selected

## Devuelve el cuerpo mas cercano al area de posesion,
## el parametro default es lo que devolvera la funcion si no hubiese cuerpos dentro del area.
func getSelectedBody(default : Controlable = null):
	if (_selectedBody == null):
		return default
	else :
		return _selectedBody
