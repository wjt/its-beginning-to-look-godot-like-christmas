extends ParallaxBackground

@export_range(-10.0, 10.0)
var speed: float = 5.0

func _process(delta: float) -> void:
	var tilt = - Input.get_axis("snow_left", "snow_right")
	
	if tilt:
		speed = clamp (speed + tilt * (20 * delta), -10.0, 10.0)
		print("speed", speed)

	scroll_offset.x -= (delta * speed)
