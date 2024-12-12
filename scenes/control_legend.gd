extends Control

@onready var _grid: GridContainer = $PanelContainer/Grid

func _ready() -> void:
	_toggle_joypad_controls(false)
	Input.joy_connection_changed.connect(_on_joy_connection_changed_cb)

func _toggle_joypad_controls(connected: bool):
	_grid.columns = (3 if connected else 2)
	for child in $PanelContainer/Grid.get_children():
		if child.is_in_group("joypad"):
			child.visible = connected

func _on_joy_connection_changed_cb(_device: int, _connected: bool):
	_toggle_joypad_controls(not Input.get_connected_joypads().is_empty())
