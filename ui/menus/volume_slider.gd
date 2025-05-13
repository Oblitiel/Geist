extends HBoxContainer

@export var busName:String
var busIndex: int
@export var labelText: String

func _ready():
	
	$Label.text = labelText
	
	busIndex = AudioServer.get_bus_index(busName)
	$VolumeSlider.value_changed.connect(_on_volume_slider_value_changed)
	
	$VolumeSlider.value = db_to_linear(AudioServer.get_bus_volume_db(busIndex))
	
func _on_volume_slider_value_changed(value):
	AudioServer.set_bus_volume_db(busIndex, linear_to_db(value))
