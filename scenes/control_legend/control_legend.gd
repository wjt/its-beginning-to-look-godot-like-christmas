extends Control

@onready var _grid: GridContainer = $PanelContainer/Grid

func _ready() -> void:
	Input.joy_connection_changed.connect(_on_joy_connection_changed_cb)

func _toggle_joypad_controls(connected: bool):
	for child in get_tree().get_nodes_in_group("joypad"):
		child.visible = connected

func _on_joy_connection_changed_cb(_device: int, _connected: bool):
	_toggle_joypad_controls(not Input.get_connected_joypads().is_empty())
