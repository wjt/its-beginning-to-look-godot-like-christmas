extends Node2D

@onready var player: AnimationPlayer = $AnimationPlayer

const ANIMATIONS = ["rodrigo", "rob"]

func _on_timer_timeout() -> void:
	player.play(ANIMATIONS.pick_random())
