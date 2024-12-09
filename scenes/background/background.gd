extends ParallaxBackground

@export_range(1.0, 10.0)
var speed: float = 5.0

func _process(delta: float) -> void:
	scroll_offset.x -= (delta * speed)
