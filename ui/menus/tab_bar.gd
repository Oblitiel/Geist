extends TabBar

@export var tabContainer: TabContainer

func _ready():
	tab_changed.connect(_on_tab_changed)
	


func _on_tab_changed(_tab):
	tabContainer.current_tab = current_tab
