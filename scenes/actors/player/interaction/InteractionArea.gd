class_name InteractionArea extends Area2D
## Este nodo se encarga de recopilar los cuerpos [Controlable] dentro de su area y elegir el mas cercano a su centro.

## Devuelve el cuerpo mas cercano al area de posesion,
## el parametro default es lo que devolvera la funcion si no hubiese cuerpos dentro del area.

func getSelectedBody() -> Node2D:
	if (get_overlapping_bodies().is_empty()):
		return null
	if (get_overlapping_bodies().size() == 1):
		return get_overlapping_bodies()[0]
	
	var nearestBody = null
	
	for body in get_overlapping_bodies():
		if nearestBody == null:
			nearestBody = body
		if abs(body.global_position - global_position) < abs(nearestBody.global_position - global_position):
			nearestBody = body
	
	return nearestBody
