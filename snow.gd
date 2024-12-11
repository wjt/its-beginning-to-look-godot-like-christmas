extends ColorRect

func adjust(shader_parameter: StringName, adjustment: float, min: float, max: float):
	var m = material as ShaderMaterial
	var value = m.get_shader_parameter(shader_parameter)
	value = clampf(value + adjustment, min, max)
	print(shader_parameter, " -> ", value)
	m.set_shader_parameter(shader_parameter, value)

func _process(delta: float) -> void:
	var tilt = Input.get_axis("snow_left", "snow_right")
	var accel = Input.get_axis("snow_slow", "snow_fast")
	
	if tilt:
		adjust("slant", tilt * delta, -0.5, 0.5)

	if accel:
		# Looks bad!
		adjust("additional_rain_speed", accel * delta, 0.1, 1)
