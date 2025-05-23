class_name InteractionArea extends Area2D
## Este nodo se encarga de recopilar los cuerpos [Controlable] dentro de su area y elegir el mas cercano a su centro.

## Devuelve el cuerpo mas cercano al area de posesion,
## el parametro default es lo que devolvera la funcion si no hubiese cuerpos dentro del area.

func getSelectedBody(group : String = "") -> Node2D:
	if (get_overlapping_bodies().is_empty()):
		return null
	if (get_overlapping_bodies().size() == 1):
		if group != "":
			if get_overlapping_bodies()[0].get_groups().has(group):
				return get_overlapping_bodies()[0]
		else:
			return get_overlapping_bodies()[0]
	
	var nearestBody = null
	
	for body in get_overlapping_bodies():
		if group != "":
			if body.get_groups().has(group):
				if nearestBody == null:
					nearestBody = body
				if abs(body.global_position - global_position) < abs(nearestBody.global_position - global_position):
					nearestBody = body
		else :
			if nearestBody == null:
				nearestBody = body
			if abs(body.global_position - global_position) < abs(nearestBody.global_position - global_position):
				nearestBody = body
	
	return nearestBody
