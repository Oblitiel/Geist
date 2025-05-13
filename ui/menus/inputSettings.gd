extends TabBar

@onready var inputButtonScene = preload("res://ui/menus/input_button.tscn")
@onready var actionList = $MarginContainer/VBoxContainer/ScrollContainer/ActionList

var isRemapping: bool = false
var actionToRemap = null
var remappingButton = null

var inputActions = {
	"up": "UP",
	"down": "DOWN",
	"left": "LEFT",
	"right": "RIGHT",
	"interact": "INTERACT",
	"possess": "POSSESS"
}

func _ready():
	createActionList()
	
func createActionList():
	InputMap.load_from_project_settings()
	for item in actionList.get_children():
		item.queue_free()
	
	for action in inputActions:
		var button = inputButtonScene.instantiate()
		var actionLabel = button.find_child("LabelAction")
		var inputLabel = button.find_child("LabelInput")
		
		actionLabel.text = inputActions[action]
		
		var events = InputMap.action_get_events(action)
		if events.size() >0:
			inputLabel.text = events[0].as_text().trim_suffix(" (Physical)")
		else:
			inputLabel.text = ""
			
		actionList.add_child(button)
		
		button.pressed.connect(onInputButtonPressed.bind(button, action))

func onInputButtonPressed(button, action):
	if !isRemapping:
		isRemapping = true
		actionToRemap = action
		remappingButton = button
		button.find_child("LabelInput").text = "PRESSKEY"
		
func _input(event):
	if isRemapping:
		if(
			event is InputEventKey ||
			(event is InputEventMouseButton && event.pressed)
		):
			
			if event is InputEventMouseButton && event.double_click:
				event.double_click = false
				
			InputMap.action_erase_events(actionToRemap)
			InputMap.action_add_event(actionToRemap, event)
			updateActionList(remappingButton, event)
			
			isRemapping = false
			actionToRemap = null
			remappingButton = null
			
			accept_event()
			
func updateActionList(button, event):
	button.find_child("LabelInput").text = event.as_text().trim_suffix(" (Physical)")
	


func _on_reset_button_pressed():
	createActionList()
