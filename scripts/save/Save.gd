class_name Save
extends Object

var slot : int
var level : String
var coins : Array

#TODO: Esto es para debuging
func _to_string() -> String:
	return JSON.stringify(Save.to_dictionary(self))

func _init(s : int, l : String, c : Array) -> void:
	slot = s
	level = l
	coins = c

func _get(property: StringName) -> Variant:
	match property:
		"slot":
			return slot
		"level":
			return level
		"coins":
			return coins
		_:
			return null

static func to_dictionary(save : Save) -> Dictionary:
	var dic : Dictionary = {}
	
	for property in save.get_property_list():
		dic[property.name] = save._get(property.name)
	
	dic.erase("script")
	dic.erase("Save.gd")
	
	return dic

static func from_dictionary(data : Dictionary) -> Save:
	return Save.new(data["slot"],data["level"],data["coins"])
