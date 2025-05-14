extends TabBar

@export var tabContainer: TabContainer

func _on_tab_changed(_tab):
	tabContainer.current_tab = current_tab
