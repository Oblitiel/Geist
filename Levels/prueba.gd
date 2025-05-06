extends NPC

func _ready():
	playerIsInteracting.emit(dialog)
